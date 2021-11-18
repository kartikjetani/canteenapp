// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAb6jcf19H42jLXEg5EJydhk6dBQw9Iv4I",
  authDomain: "canteenapp-9ea2e.firebaseapp.com",
  projectId: "canteenapp-9ea2e",
  storageBucket: "canteenapp-9ea2e.appspot.com",
  messagingSenderId: "442211260619",
  appId: "1:442211260619:web:925d601ee94124a8d5234e",
  measurementId: "G-9KVT2HMPHT"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);