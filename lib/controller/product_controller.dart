import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

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
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValue() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }
}
