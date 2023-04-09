import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/presentation/catergory_screen.dart/items_details.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      controller.subCat.length,
                      (index) => controller.subCat[index]
                          .toString()
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .size(15)
                          .align(TextAlign.center)
                          .makeCentered()
                          .box
                          .size(120, 60)
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .white
                          .rounded
                          .make()),
                ),
              ),

              ///iTEMS CONTAINER
              ///
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP5,
                                width: 200,
                                height: 150,
                                fit: BoxFit.fitWidth,
                              ),
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
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .roundedSM
                              .outerShadowSm
                              .padding(const EdgeInsets.all(12))
                              .white
                              .make()).onTap(() {
                Get.to(const ItemDetails(title: 'hello'));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
