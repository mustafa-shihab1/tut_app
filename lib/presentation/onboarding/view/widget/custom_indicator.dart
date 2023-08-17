import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constants_manager.dart';

class CustomIndicator extends StatelessWidget {
   final PageController pageController;
   final SliderViewObject sliderViewObject;
  const CustomIndicator({
    super.key,
     required this.pageController,
    required this.sliderViewObject,
});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: ColorTransitionEffect(
        activeDotColor: ColorManager.primary,
        dotHeight: AppConstants.dotHeight,
        dotWidth: AppConstants.dotWidth,
        spacing: AppConstants.dotSpacing,
        dotColor: ColorManager.lightGrey,
      ),
      controller: pageController,
      count: sliderViewObject.numOfSlides,
    );
  }
}
