import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/presentation/home_screen/components/featured_button.dart';

import '../../consts/lists.dart';
import '../../widgets_common/home_button.dart';

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
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),

                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featuredButton(
                                        icon: featuredImages1[index],
                                        title: featuredTitle1[index]),
                                    10.heightBox,
                                    featuredButton(
                                        icon: featuredImages2[index],
                                        title: featuredTitle2[index]),
                                  ],
                                )),
                      ),
                    ),
                    //Feature Products
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                  (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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

                    //Third Swiper

                    20.heightBox,

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

                    //ALL products section,
                    20.heightBox,

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 300,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 200,
                            fit: BoxFit.fitWidth,
                          ),
                          const Spacer(),
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
                          .padding(const EdgeInsets.all(12))
                          .white
                          .make(),
                    )
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
