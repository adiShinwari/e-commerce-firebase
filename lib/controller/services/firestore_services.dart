import 'package:e_commerce_app/consts/consts.dart';

class FireStoreServices {
  //get users data
  static getUser(email) {
    return firestore
        .collection(usersCollection)
        .where('email', isEqualTo: email)
        .snapshots();
  }

  //get products according to category

  static getProducts(category) {
    return firestore
        .collection(productsCollections)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollections)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  static deleteDocument(docId) async {
    return await firestore.collection(cartCollections).doc(docId).delete();
  }

  static getChatMessages(docID) {
    return firestore
        .collection(chatsCollection)
        .doc(docID)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }
}
