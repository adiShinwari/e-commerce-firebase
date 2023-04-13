import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:intl/intl.dart' as intl;

Widget senderBubble(
  DocumentSnapshot data,
) {
  var t =
      data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  var time = intl.DateFormat("h:mma").format(t);
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10, top: 5),
    decoration: BoxDecoration(
      color: data['uid'] != currentUser!.uid ? darkFontGrey : redColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "${data['msg']}".text.color(whiteColor).size(16).make(),
        10.heightBox,
        time.text.color(Colors.white.withOpacity(0.5)).make()
      ],
    ),
  );
}
