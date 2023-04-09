import 'package:e_commerce_app/consts/consts.dart';

class FireStoreServices {
  //get users data
  static getUser(email) {
    return firestore
        .collection(usersCollection)
        .where('email', isEqualTo: email)
        .snapshots();
  }
}
