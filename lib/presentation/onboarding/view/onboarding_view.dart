import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_start_up_project/domain/models/sliderobject.dart';
import 'package:flutter_start_up_project/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/color_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/constant_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/string_manager.dart';
import 'package:flutter_start_up_project/presentation/resources_manager/values_manager.dart';
import 'package:flutter_start_up_project/presentation/routes_manager/routes_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) => _getContentWidget(snapshot.data),
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numberOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(
                  sliderObject: sliderViewObject.sliderobject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          // height: AppSize.s100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    child: Text(
                      AppString.skip,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPading.p8),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s18,
                height: AppSize.s18,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.white,
                ),
              ),
              onTap: () {
                // go to  previous slide
                _pageController.animateToPage(_viewModel.goPreviousSlide(),
                    duration: const Duration(
                        milliseconds: AppConstant.sliderAnimation),
                    curve: Curves.bounceInOut);
              },
            ),
          ),

          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPading.p8),
                  child: _getProparCirculer(i, sliderViewObject.currentIndex),
                ),
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPading.p8),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s18,
                height: AppSize.s18,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.white,
                ),
              ),
              onTap: () {
                // go to  next slide
                _pageController.animateToPage(_viewModel.goNextSlide(),
                    duration: const Duration(
                        milliseconds: AppConstant.sliderAnimation),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProparCirculer(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return Icon(
        Icons.circle,
        color: ColorManager.white,
      );
    } else {
      return Icon(
        Icons.circle_outlined,
        color: ColorManager.white,
      );
    }
  }

  @override
  void dispose() {
    _viewModel.dispode();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({Key? key, required this.sliderObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s25,
        ),

        /// title
        Padding(
          padding: const EdgeInsets.all(AppPading.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),

        /// subtitle
        Padding(
          padding: const EdgeInsets.all(AppPading.p8),
          child: Text(
            sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),

        SvgPicture.asset(sliderObject.image),

        const SizedBox(
          height: AppSize.s60,
        ),
      ],
    );
  }
}
