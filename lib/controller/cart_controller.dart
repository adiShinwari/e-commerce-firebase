import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  //text controller shipping detials

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var phoneNumController = TextEditingController();

  //payment method index

  late dynamic productSnapshot;
  var products = [];

  var paymentIndex = 0.obs;
  calculateTPriceCart({data}) {
    totalP = 0.obs;
    for (var i = 0; i < data.length; i++) {
      totalP = totalP + int.parse(data[i]['tPrice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      "order_by": currentUser!.uid,
      "order_by_name": Get.find<HomeController>().userName,
      "order_by_email": currentUser!.email,
      "order_by_address": addressController.text,
      "order_by_state": stateController.text,
      "order_by_city": cityController.text,
      "order_by_phone": phoneNumController.text,
      "order_by_postalcode": postalCodeController.text,
      "shipping_method": "Home Delivery",
      "order_placed": true,
      "order_confirmed": false,
      "order_delivered": false,
      "order_on_delivery": false,
      "Payment_method": orderPaymentMethod,
      "total_amount": totalAmount,
      "orders": FieldValue.arrayUnion(products),
    });
  }

  getProductDetails() {
    products.clear();
    for (int i = 0; i < productSnapshot.length; i++) {
      products.add({
        "color": productSnapshot[i]['color'],
        "title": productSnapshot[i]['title'],
        "qty": productSnapshot[i]['qty'],
        "img": productSnapshot[i]['img'],
      });
      print(products);
    }
  }
}
