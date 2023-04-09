import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ProfileController extends GetxController {
  var profileImagePath = "".obs;

  var nameController = TextEditingController();
  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();

  var profileImageLink = '';
  var isLoading = false.obs;

  changeImage(BuildContext context) async {
    try {
      final img = await ImagePicker.platform.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (img == null) {
        return;
      }
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    if (profileImagePath.value.isEmpty) {
      return;
    }
    String basename = p.basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$basename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));

    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imageUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set(
        {'name': name, 'password': password, "imageUrl": profileImageLink},
        SetOptions(merge: true));
    isLoading(false);
  }

  changeAuthPassword({email, password, newPass}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    currentUser!.reauthenticateWithCredential(cred).then((value) async {
      await currentUser!.updatePassword(newPassword).then((value) {
        print('yesss');
      });
    }).catchError((e) {
      print(e.toString());
    });
  }
}
