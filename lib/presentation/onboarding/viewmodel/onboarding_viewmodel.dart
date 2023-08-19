import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/presentation/base/base_viewmodel.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/constants_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';

class OnBoardingViewModel implements BaseViewModel, OnBoardingViewModelInputs, OnBoardingViewModelOutputs{

  final StreamController _streamController =  StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goPrevious(PageController pageController) {
    pageController.previousPage(duration: const Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.easeIn);
  }

  @override
  void goNext(PageController pageController,context) {
    if(_currentIndex == _list.length - 1){
      goToLogin(context);
    }else{
      pageController.nextPage(duration: const Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.easeIn);
    }
  }

  @override
  void goToLogin(context) {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;


  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex],_list.length,_currentIndex));
  }

  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
  ];
}

abstract class OnBoardingViewModelInputs{
  void goNext(PageController pageController,context);
  void goPrevious(PageController pageController);
  void goToLogin(context);
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs{
  Stream<SliderViewObject> get outputSliderViewObject;
}