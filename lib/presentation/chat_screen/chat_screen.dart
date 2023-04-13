import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/services/firestore_services.dart';
import 'package:get/get.dart';

import '../../controller/chat_controller.dart';
import 'components/center_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "${controller.friendName}"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    )
                  : Expanded(
                      child: Container(
                          child: StreamBuilder(
                              stream: FireStoreServices.getChatMessages(
                                  controller.chatDocId.toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation(redColor)),
                                  );
                                } else if (snapshot.data!.docs.isEmpty) {
                                  return Center(
                                    child: "Send a message..."
                                        .text
                                        .color(darkFontGrey)
                                        .make(),
                                  );
                                } else {
                                  return ListView(
                                    children: snapshot.data!.docs
                                        .mapIndexed((currentValue, index) {
                                      var data = snapshot.data!.docs[index];
                                      return Align(
                                          alignment:
                                              data['uid'] == currentUser!.uid
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                          child: senderBubble(
                                            data,
                                          ));
                                    }).toList(),
                                  );
                                }
                              })),
                    ),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.messageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        ),
                      ),
                      hintText: "Type a message",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.sendMessage(controller.messageController.text);
                    controller.messageController.clear();
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            )
                .box
                .height(80)
                .padding(const EdgeInsets.all(12))
                .margin(const EdgeInsets.only(bottom: 8))
                .make()
          ],
        ),
      ),
    );
  }
}
