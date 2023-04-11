import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../../consts/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        viewportFraction: 1.0,
                        itemCount: data['p_images'].length,
                        itemBuilder: (ctx, index) => Image.network(
                              data['p_images'][index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                    10.heightBox,
                    title!.text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .size(16)
                        .make(),
                    VxRating(
                      isSelectable: false,
                      onRatingUpdate: (value) {},
                      normalColor: darkFontGrey,
                      selectionColor: golden,
                      count: 5,
                      maxRating: 5,
                      size: 25,
                      value: double.parse(data['p_rating']),
                    ),
                    10.heightBox,
                    '${data['p_price']}'
                        .numCurrencyWithLocale()
                        .text
                        .color(redColor)
                        .size(18)
                        .fontFamily(bold)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Seller"
                                .text
                                .color(whiteColor)
                                .fontFamily(semibold)
                                .make(),
                            5.heightBox,
                            "${data["p_seller"]}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make()
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    //COLOR SECTION
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Colors: ".text.color(Colors.black).make(),
                            ),
                            Obx(
                              () => Row(
                                children: List.generate(
                                  data["p_color"].length,
                                  (index) => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      VxBox()
                                          .margin(
                                            const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                          )
                                          .size(40, 40)
                                          .color(Color(data['p_color'][index])
                                              .withOpacity(1.0))
                                          .roundedLg
                                          .make()
                                          .onTap(() {
                                        controller.changeColorIndex(index);
                                      }),
                                      Visibility(
                                        visible: index ==
                                            controller.colorIndex.value,
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.white ==
                                                  Color(data['p_color'][index])
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity: ".text.color(Colors.black).make(),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.decreaseQuantity();
                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.remove)),
                                  controller.quantity.value.text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                      onPressed: () {
                                        controller.increaseQuantity(
                                            int.parse(data['p_quantity']));
                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.add)),
                                  10.widthBox,
                                  "(${data['p_quantity']} available)"
                                      .text
                                      .color(Colors.black)
                                      .make()
                                ],
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //TOTAL ROW
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(Colors.black).make(),
                            ),
                            Obx(
                              () => "${controller.totalPrice.value}"
                                  .numCurrency
                                  .text
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .size(16)
                                  .make(),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.shadowSm.white.make(),
                    10.heightBox,
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    '${data['p_desc']}'.text.color(darkFontGrey).make(),
                    //Buttons section
                    10.heightBox,
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemsDetailButton.length,
                        (index) => ListTile(
                          trailing: const Icon(Icons.arrow_forward),
                          title: itemsDetailButton[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                        )
                            .box
                            .color(whiteColor)
                            .margin(const EdgeInsets.symmetric(vertical: 5))
                            .make(),
                      ),
                    ),
                    //
                    productsyoumaylike.text
                        .fontFamily(bold)
                        .size(16)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 150,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    10.heightBox,
                                    "Laptop 4gb/64gb"
                                        .text
                                        .color(darkFontGrey)
                                        .fontFamily(semibold)
                                        .make(),
                                    10.heightBox,
                                    "\$400"
                                        .text
                                        .color(redColor)
                                        .size(16)
                                        .fontFamily(bold)
                                        .make()
                                  ],
                                )
                                    .box
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(8))
                                    .white
                                    .make()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to cart"),
          )
        ],
      ),
    );
  }
}
