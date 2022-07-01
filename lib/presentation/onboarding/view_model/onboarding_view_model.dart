import 'dart:async';

import 'package:flutter_start_up_project/domain/models/sliderobject.dart';
import 'package:flutter_start_up_project/presentation/base/base_viewmodel.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/assets_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/string_manager.dart';

class OnBoardingViewModel extends BaseViewodel
    with onBoardingViewModelInputs, onBoardingViewModelOutputs {
// stream controllers outputs

  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currntIndex = 0;
  @override
  void dispode() {
    // TODO: implement dispode
    _streamController.close();
  }

  @override
  void start() {
    // viewmodel start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNextSlide() {
    int nextIndex = ++_currntIndex;
    if (nextIndex >= _list.length) nextIndex = 0;

    return nextIndex;
  }

  @override
  int goPreviousSlide() {
    int previousIndex = --_currntIndex;
    if (previousIndex == -1) previousIndex = _list.length - 1;

    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currntIndex = index;
    _postDataToView();
  }

// OnBoarding ViewModel Inputs
  @override
  Sink get inputSilderViewObject => _streamController.sink;

// OnBoarding ViewModel Outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

// onBoarding private functions

  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: AppString.onBoardingTitle1,
            subtitle: AppString.onBoardingSubTitle1,
            image: ImageAssets.mouse),
        SliderObject(
            title: AppString.onBoardingTitle2,
            subtitle: AppString.onBoardingSubTitle2,
            image: ImageAssets.cat),
        SliderObject(
            title: AppString.onBoardingTitle3,
            subtitle: AppString.onBoardingSubTitle3,
            image: ImageAssets.dog),
        SliderObject(
            title: AppString.onBoardingTitle4,
            subtitle: AppString.onBoardingSubTitle4,
            image: ImageAssets.decorativs),
      ];

  void _postDataToView() {
    inputSilderViewObject.add(SliderViewObject(
      sliderobject: _list[_currntIndex],
      numberOfSlides: _list.length,
      currentIndex: _currntIndex,
    ));
  }
}

/// inputes mean that "Orders" that our view model will recive from View
abstract class onBoardingViewModelInputs {
  void goNextSlide(); // when user click on right arrow or swaipe left
  void goPreviousSlide(); // when user click on left arrow or swaipe right
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSilderViewObject;
}

abstract class onBoardingViewModelOutputs {
// Stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
