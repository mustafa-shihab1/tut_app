import 'package:flutter/material.dart';
import 'package:tut_app/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class CustomArrows extends StatelessWidget {
  const CustomArrows({
    super.key,
    required OnBoardingViewModel viewModel,
    required PageController pageController,
    required this.context,
  }) : _viewModel = viewModel, _pageController = pageController;

  final OnBoardingViewModel _viewModel;
  final PageController _pageController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.s26,
            child: IconButton(
              onPressed: (){
                _viewModel.goPrevious(_pageController);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: ColorManager.white,
              ),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: AppSize.s26,
            child: IconButton(
              onPressed: (){
                _viewModel.goNext(_pageController,context);
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
