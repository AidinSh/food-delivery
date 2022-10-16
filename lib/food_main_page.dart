import 'package:ecommerce_app/app_colors.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/food_scroll_view.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  _FoodMainPageState createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Iran", color: AppColors.primaryColor,),
                      Row(
                        children: [
                          SmallText(text: "Tehran"),
                          Icon(Icons.arrow_drop_down_rounded, color: AppColors.regularTextColor,)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor
                    ),
                    child: Icon(Icons.search),
                  )
                ],
              ),
            ),
            Gap(10),
            FoodScrollView()
          ],
        ),
      ),
    );
  }
}
