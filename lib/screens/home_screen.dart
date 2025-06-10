import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:men_store/core/controller/main_controller.dart';
import 'package:men_store/core/model/category_model.dart';
import 'package:men_store/core/widgets/entry_list_item.dart';
import 'package:men_store/screens/description_screen.dart';

import '../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          _txtView(),
          _searchView(),
          _newArrival(),
          _category(),
        ],
      ),
    );
  }

  Widget _newArrival() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
          child: EntryListItem(
            index: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arrival',
                  style: AppTextStyle.bodyRegular[24]?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: AppTextStyle.bodyRegular[14]?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyScale[20],
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(
              left: Dimens.s_20(),
              top: Dimens.verticalBlockSize * 2,
            ),
            child: Row(
              children: List.generate(MainController.to.newArrival.length, (i) {
                return EntryListItem(
                  index: i,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => DescriptionScreen(
                          img: MainController.to.newArrival[i],
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: Dimens.s_15()),
                      height: Dimens.verticalBlockSize * 25,
                      width: Dimens.verticalBlockSize * 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(MainController.to.newArrival[i]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _category() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.s_20(),
            vertical: Dimens.verticalBlockSize * 2,
          ),
          child: EntryListItem(
            index: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: AppTextStyle.bodyRegular[24]?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: AppTextStyle.bodyRegular[14]?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyScale[20],
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: Dimens.s_20()),
            child: Row(
              children: List.generate(MainController.to.category.length, (i) {
                CategoryModel category = MainController.to.category[i];
                return EntryListItem(
                  index: i,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: Dimens.s_15()),
                        child: Image.asset(category.img, scale: 4),
                      ),
                      SizedBox(height: Dimens.verticalBlockSize * 1.2),
                      Padding(
                        padding: EdgeInsets.only(right: Dimens.s_15()),
                        child: Text(
                          category.title,
                          style: AppTextStyle.bodyRegular[14]?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchView() {
    return EntryListItem(
      index: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.s_20(),
          vertical: Dimens.verticalBlockSize * 2.5,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimens.s_15()),
                height: Dimens.verticalBlockSize * 6.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(ImagesAsset.search, scale: 3.5),
                    SizedBox(width: Dimens.s_12()),
                    DefaultTextStyle(
                      style: AppTextStyle.bodyRegular[14]!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyScale[20],
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration(milliseconds: 100),
                        animatedTexts: [
                          RotateAnimatedText('Search your style'),
                          RotateAnimatedText('Find your next look'),
                          RotateAnimatedText('What’s your vibe today?'),
                        ],
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: Dimens.s_15()),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimens.verticalBlockSize * 2.2,
                horizontal: Dimens.s_20(),
              ),
              decoration: BoxDecoration(
                gradient: AppColors.linearGradient,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.orange.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(ImagesAsset.setting, scale: 4.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _txtView() {
    return EntryListItem(
      index: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Be unique',
              style: AppTextStyle.bodyRegular[35]?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'With your own style',
              style: AppTextStyle.bodyRegular[30]?.copyWith(
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.s_20()),
        child: EntryListItem(
          index: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
                child: Image.asset(ImagesAsset.star, scale: 5),
              ),
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
                child: Image.asset(ImagesAsset.category, scale: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
