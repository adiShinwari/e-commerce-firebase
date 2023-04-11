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
}
