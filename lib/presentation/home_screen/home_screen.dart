import 'package:e_commerce_app/consts/consts.dart';

import '../../consts/lists.dart';
import '../../widgets_comman/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      padding: const EdgeInsets.all(12),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: lightGrey,
              height: 60,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchAnything,
                    hintStyle: TextStyle(
                      color: textfieldGrey,
                    )),
              ),
            ),
            //Swiper Brands
            10.heightBox,

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        height: 150,
                        itemCount: slidersList.length,
                        itemBuilder: (ctx, index) => Image.asset(
                              slidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .clip(Clip.antiAlias)
                                .make()),

                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => homeButtons(
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todayDeal : flashSale,
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5),
                      ),
                    ),
                    10.heightBox,

                    VxSwiper.builder(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        height: 150,
                        itemCount: secondSliderslidersList.length,
                        itemBuilder: (ctx, index) => Image.asset(
                              secondSliderslidersList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .clip(Clip.antiAlias)
                                .make()),

                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButtons(
                                height: context.screenHeight * 0.10,
                                width: context.screenWidth / 3.5,
                                icon: index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller,
                                title: index == 0
                                    ? topCategories
                                    : index == 1
                                        ? brand
                                        : topSeller,
                              )),
                    ),
                    //Featured Categories,
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
