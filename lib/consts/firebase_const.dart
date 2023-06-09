import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

//Collections

const usersCollection = 'users';
const productsCollections = 'products';
const cartCollections = 'cart';
const chatsCollection = "chats";
const messagesCollection = "Messages";
const ordersCollection = "orders";
