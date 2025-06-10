import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:men_store/core/controller/main_controller.dart';
import 'package:men_store/core/model/intro_model.dart';
import 'package:men_store/core/widgets/entry_list_item.dart';
import 'package:men_store/screens/home_screen.dart';

import '../core/constants/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final RxInt _currentPage = 0.obs;

  @override
  void initState() {
    super.initState();
    // Listen to page changes
    _pageController.addListener(() {
      int page = _pageController.page!.round();
      if (page != _currentPage.value) {
        setState(() {
          _currentPage.value = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Dimens().init(context);
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [_introView(), _titleView(), _letsStart(), _dottedView()],
      ),
    );
  }

  Widget _titleView() {
    return SafeArea(
      child: Column(
        children: [
          Image.asset(ImagesAsset.star, scale: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Men',
                  style: AppTextStyle.bodyRegular[24]?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: FontFamily.poppins,
                  ),
                ),
                TextSpan(
                  text: 'Store',
                  style: AppTextStyle.bodyRegular[24]?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.orange,
                    fontFamily: FontFamily.poppins,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dottedView() {
    return Positioned(
      bottom: Dimens.verticalBlockSize * 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (i) {
          return Container(
            height: 15,
            width: 15,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentPage.value != i
                      ? Colors.white
                      : AppColors.lightOrange,
            ),
          );
        }),
      ),
    );
  }

  Widget _introView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: MainController.to.intro.length,
      itemBuilder: (c, i) {
        IntroModel intro = MainController.to.intro[i];
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Dimens.s_20(),
                right: Dimens.s_20(),
                top: Dimens.verticalBlockSize * 20,
              ),
              child: EntryListItem(
                index: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      intro.title,
                      style: AppTextStyle.bodyRegular[40]?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      intro.des,
                      style: AppTextStyle.bodyRegular[35]?.copyWith(
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: Dimens.verticalBlockSize * 6),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                i == 0
                                    ? Color(0xff405C60)
                                    : i == 1
                                    ? Color(0xffF69755)
                                    : Color(0xffC4BEB0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: Dimens.verticalBlockSize * 40,
                          width: Dimens.horizontalBlockSize * 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            image: DecorationImage(
                              image: AssetImage(intro.img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _letsStart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: EntryListItem(
        index: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimens.verticalBlockSize * 4,
            horizontal: Dimens.s_20(),
          ),
          child: Bounceable(
            onTap: () {
              if (_currentPage.value == 2) {
                Get.to(() => HomeScreen());
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimens.verticalBlockSize * 2.5,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.linearGradient,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: AppTextStyle.bodyRegular[15]?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: Dimens.s_8()),
                  Image.asset(ImagesAsset.forward, scale: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
