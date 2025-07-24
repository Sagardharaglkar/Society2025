<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tempForm.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Society2024.tempForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        .profile-container {
            position: relative;
            width: 150px;
            height: 150px;
            margin: auto;
        }

        #profileImage {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #000;
            cursor: pointer;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: 0.3s;
            cursor: pointer;
        }

        .profile-container:hover .overlay {
            opacity: 1;
        }

        #cropModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0,0,0,0.8);
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        #cropBox {
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        #preview {
            max-width: 300px;
            max-height: 300px;
        }

        .btn-group {
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
        }

        button {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-upload {
            background: #4CAF50;
            color: white;
        }

        .btn-cancel {
            background: #f44336;
            color: white;
        }
    </style>
        <div class="profile-container">
            <img id="profileImage" src="img/profilePic.png" alt="Profile">
            <div class="overlay" onclick="document.getElementById('fileInput1').click()">
                <div>📷<br>
                    Change<br>
                    profile photo</div>
            </div>
        </div>

        <input type="file" id="fileInput1" accept="image/*" style="display: none" />
        <!-- Crop Modal -->
        <div id="cropModal">
            <div id="cropBox">
                <p><strong>Drag the image to adjust</strong></p>
                <img id="preview" />
                <div class="btn-group">
                    <asp:Button runat="server" class="btn-upload" OnClientClick="uploadCroppedImage()" Text="Upload ✅" UseSubmitBehavior="False"></asp:Button>
                    <button class="btn-cancel" onclick="closeModal()">Cancel ❌</button>
                </div>
            </div>
        </div>
          <asp:HiddenField runat="server" ID="ownerH"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js"></script>
    <script>
        const fileInput = document.getElementById('fileInput1');
        const profileImage = document.getElementById('profileImage');
        const cropModal = document.getElementById('cropModal');
        const preview = document.getElementById('preview');
        let cropper;

        fileInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (!file) return;
            const reader = new FileReader();
            reader.onload = () => {
                preview.src = reader.result;
                cropModal.style.display = 'flex';
                if (cropper) cropper.destroy();
                cropper = new Cropper(preview, {
                    aspectRatio: 1,
                    viewMode: 1,
                    dragMode: 'move',
                    responsive: true,
                    zoomable: true,
                });
            };
            reader.readAsDataURL(file);
        });

        function closeModal() {
            cropModal.style.display = 'none';
            cropper.destroy();
        }

        function uploadCroppedImage() {
            const canvas = cropper.getCroppedCanvas({
                width: 150,
                height: 150,
            });

            const dataUrl = canvas.toDataURL('image/png');
            const ownerId = document.getElementById("<%= ownerH.ClientID %>").value;

            // Update image preview
            profileImage.src = dataUrl;
            closeModal();

            // Send to server with imageData and ownerId
            fetch('UploadImageHandler.ashx', {
                method: 'POST',
                body: JSON.stringify({ imageData: dataUrl, ownerId: ownerId }),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(response => response.text())
                .then(data => console.log("Server:", data))
                .catch(error => console.error("Upload failed:", error));
        }


    </script>

</asp:Content>
