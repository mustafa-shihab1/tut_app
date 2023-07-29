import 'package:flutter/material.dart';
import 'package:tut_app/domain/model/onboarding_models.dart';
import 'package:tut_app/presentation/onboarding/view/widget/custom_arrows.dart';
import 'package:tut_app/presentation/onboarding/view/widget/custom_indicator.dart';
import 'package:tut_app/presentation/onboarding/view/widget/custom_onboarding_page.dart';
import 'package:tut_app/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/styles_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  late final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();


  @override
  void initState(){
    _viewModel.start();
    super.initState();
  }

  @override
  void dispose(){
    _viewModel.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
        builder:(context, snapshot) =>  _getContentWidget(snapshot.data),
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    return sliderViewObject == null ?
      Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
          child: CircularProgressIndicator(color: ColorManager.primary,),
        ),
      )
    :
      Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
        ),
        body: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: sliderViewObject.numOfSlides,
                onPageChanged: (index) {
                  _viewModel.onPageChanged(index);
                },
                itemBuilder: (context,index){
                  return OnBoardingPage(sliderViewObject.sliderObject);
                }),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: () {
                  _viewModel.goToLogin(context);
                },
                child: Text(
                  AppStrings.skip,
                  style: getMediumStyle(color: ColorManager.primary,fontSize: AppSize.s14),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomIndicator(
              pageController: _pageController,
              sliderViewObject: sliderViewObject,
            ),
            CustomArrows(
                viewModel: _viewModel,
                pageController: _pageController,
                context: context
            ),
          ],
        ),
      );

  }

}






