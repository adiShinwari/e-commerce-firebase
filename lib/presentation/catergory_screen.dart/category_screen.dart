import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/presentation/catergory_screen.dart/category_details.dart';
import 'package:e_commerce_app/widgets_common/bg_widget.dart';
import 'package:get/route_manager.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(title: categories.text.fontFamily(bold).white.make()),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200),
          itemBuilder: (context, index) => Column(
            children: [
              Image.asset(
                categoriesImages[index],
                height: 120,
                width: 200,
                fit: BoxFit.cover,
              ),
              10.heightBox,
              categoriesList[index]
                  .text
                  .color(darkFontGrey)
                  .align(TextAlign.center)
                  .make()
            ],
          )
              .box
              .rounded
              .white
              .outerShadowSm
              .clip(Clip.antiAlias)
              .make()
              .onTap(() {
            Get.to(CategoryDetails(title: categoriesList[index]));
          }),
        ),
      ),
    ));
  }
}
