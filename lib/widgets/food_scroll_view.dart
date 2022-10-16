import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/app_colors.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/icon_text.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FoodScrollView extends StatefulWidget {
  const FoodScrollView({Key? key}) : super(key: key);

  @override
  _FoodScrollViewState createState() => _FoodScrollViewState();
}

class _FoodScrollViewState extends State<FoodScrollView> {

  var currentPageValue = 0.0;
  var scaleFactor = 0.8;
  double containerHeight = 220;

  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            itemCount: 5,
            controller: pageController,
            itemBuilder: (context, position){
              return mainFoodItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }


  Widget mainFoodItem(int index){

    Matrix4  matrix = Matrix4.identity();
    matrix = scalingItems(index);

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: containerHeight,
            margin: EdgeInsets.only(top: 5, right: 10, left: 10),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/food_pasta.jpg")
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 120,
              margin: EdgeInsets.only(top : 5, bottom: 20, right: 40, left: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 5,
                      color: Colors.grey
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chef Pasta"),
                  Gap(10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(4, (index) => Icon(
                          Icons.star,
                          color: AppColors.primaryColor, size: 15,))
                      ),
                      Icon(Icons.star_half, color: AppColors.primaryColor, size: 15,),
                      Gap(5),
                      SmallText(text: "4.5"),
                      Gap(20),
                      SmallText(text: "476"),
                      Gap(2),
                      SmallText(text: "comments")
                    ],
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(text: "Normal", icon: Icons.circle, iconColor: AppColors.iconColor_1),
                      IconText(text: "1.7km", icon: Icons.location_on_rounded , iconColor: AppColors.primaryColor),
                      IconText(text: "32 min", icon: Icons.access_time, iconColor: AppColors.iconColor_2)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Matrix4 scalingItems(int index){

    if (index == currentPageValue.floor()){
      var currentScale = 1-(currentPageValue-index)*(1-scaleFactor);
      var verticalTransform = containerHeight*(1-currentScale)/2;
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, verticalTransform, 0);

    } else if (index == currentPageValue.floor()+1){
      var currentScale = scaleFactor + (currentPageValue-index+1)*(1-scaleFactor);
      var verticalTransform = containerHeight*(1-currentScale)/2;
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, verticalTransform, 0);

    } else if (index == currentPageValue.floor()-1){
      var currentScale = scaleFactor + (currentPageValue-index-1)*(1-scaleFactor);
      var verticalTransform = containerHeight*(1-currentScale)/2;
      return Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, verticalTransform, 0);

    } else {
      var verticalTransform = containerHeight*(1-scaleFactor)/2;
      return Matrix4.diagonal3Values(1, scaleFactor, 1)..setTranslationRaw(0, verticalTransform, 0);

    }
  }
}
