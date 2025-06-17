importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compa t.js');
importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js');

// Initialize Firebase
firebase.initializeApp({
    apiKey: "AIzaSyCVD6hUSK4zMfG43bMjyjwTFmTz5PJc_qk",
    authDomain: "society-management-32053.firebaseapp.com",
    projectId: "society-management-32053",
    storageBucket: "society-management-32053.appspot.com",
    messagingSenderId: "303424747645",
    appId: "1:303424747645:web:a10ad8eceb38c4fe10d914",
    measurementId: "G-MCRPPNVW38"
});

const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage(function (payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
        icon: 'img/building.png', // optional icon
        data: {
            click_action: payload.notification.click_action || 'https://localhost:44309/support_ticket'
        }
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});




//importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js');
//importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js');

//firebase.initializeApp({
//    apiKey: "AIzaSyCVD6hUSK4zMfG43bMjyjwTFmTz5PJc_qk",
//    authDomain: "society-management-32053.firebaseapp.com",
//    projectId: "society-management-32053",
//    storageBucket: "society-management-32053.appspot.com",
//    messagingSenderId: "303424747645",
//    appId: "1:303424747645:web:a10ad8eceb38c4fe10d914",
//    measurementId: "G-MCRPPNVW38"
//});

//const messaging = firebase.messaging();

//messaging.onBackgroundMessage(function (payload) {
//    console.log('[firebase-messaging-sw.js] Received background message ', payload);
//    const title = payload.notification.title;
//    const options = {
//        body: payload.notification.body
//    };
//    self.registration.showNotification(title, options);
//});
