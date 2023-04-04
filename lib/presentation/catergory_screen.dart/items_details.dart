import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/widgets_common/our_button.dart';

import '../../consts/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                        itemCount: 3,
                        itemBuilder: (ctx, index) => Image.asset(
                              imgFc5,
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
                      onRatingUpdate: (value) {},
                      normalColor: darkFontGrey,
                      selectionColor: golden,
                      stepInt: true,
                      count: 5,
                      size: 25,
                    ),
                    10.heightBox,
                    "\$30,000"
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
                            "In house brands"
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
                              child:
                                  "Colors: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .margin(
                                      const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                    )
                                    .size(40, 40)
                                    .color(index == 0
                                        ? Colors.red
                                        : index == 1
                                            ? Colors.green
                                            : Colors.blue)
                                    .roundedLg
                                    .make(),
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                '0'
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)".text.color(textfieldGrey).make()
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //TOTAL ROW
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),
                            "\$0.00"
                                .text
                                .fontFamily(bold)
                                .color(redColor)
                                .size(16)
                                .make()
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
                    "This is dummy text and description here ...... This is dummy text and description here ...... This is dummy text and description here ......"
                        .text
                        .color(darkFontGrey)
                        .make(),
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
