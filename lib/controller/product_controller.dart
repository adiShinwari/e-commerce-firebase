import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  var isFav = false.obs;

  var subCat = [];
  getSubCategories(title) async {
    subCat.clear();
    var data = await rootBundle
        .loadString('lib/controller/services/category_model.json');
    var decoded = categoryModelFromJson(data);

    var s =
        decoded.categories.where((element) => element.name == title).toList();
    for (var e in s[0].subcategory) {
      subCat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value += 1;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value -= 1;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  Future addToCart(
      {title, img, price, sellerName, color, qty, tPrice, context}) async {
    await firestore.collection(cartCollections).doc().set({
      "title": title,
      "img": img,
      "price": price,
      "sellerName": sellerName,
      "qty": qty,
      "tPrice": tPrice,
      'added_by': currentUser!.uid,
      "color": color,
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValue() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }

  addToWishList(docid, context) async {
    await firestore.collection(productsCollections).doc(docid).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);

    VxToast.show(context, msg: "Added to wishlist");
  }

  removeFromWishList(docid, context) async {
    await firestore.collection(productsCollections).doc(docid).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    VxToast.show(context, msg: "Removed from wishlist");
  }

  checkIfFav(data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }
}
