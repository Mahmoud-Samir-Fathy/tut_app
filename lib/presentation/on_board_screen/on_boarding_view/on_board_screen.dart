import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/on_board_screen/on_boarding_view_model/on_boarding_view_model.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constant_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _controller = PageController();
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind() {
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnBoardContentView>(
        stream: _onBoardingViewModel.outputOnBoard,
        builder: (context, snapshot) {
          return _getViewContent(snapshot.data);
        });
  }

  Widget _getViewContent(OnBoardContentView? contentView) {
    if (contentView == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorManager.whiteColor,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.whiteColor),
        ),
        body: PageView.builder(
            controller: _controller,
            itemCount: contentView.sliderLength,
            onPageChanged: (index) {
              _onBoardingViewModel.onPageChange(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(contentView.onBoardContent);
            }),
        bottomSheet: Container(
          height: AppSizes.s100,
          color: ColorManager.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginScreen);
                      },
                      child: Text(
                        AppStrings.skip,
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                ],
              ),
              const SizedBox(height: AppSizes.s4),
              Container(
                color: ColorManager.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: SizedBox(
                          height: AppSizes.s20,
                          width: AppSizes.s20,
                          child: GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                  _onBoardingViewModel.previousPage(),
                                  duration: const Duration(
                                      milliseconds:
                                          ConstantManager.pageViewDelay),
                                  curve: Curves.bounceInOut);
                            },
                            child: SvgPicture.asset(AssetsManager.leftArrowIc),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < contentView.sliderLength; i++)
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: _getSelectedIcon(
                                  i, contentView.currentSliderNumber),
                            )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: SizedBox(
                          height: AppSizes.s20,
                          width: AppSizes.s20,
                          child: GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                  _onBoardingViewModel.nextPage(),
                                  duration: const Duration(
                                      milliseconds:
                                          ConstantManager.pageViewDelay),
                                  curve: Curves.bounceInOut);
                            },
                            child: SvgPicture.asset(AssetsManager.rightArrowIc),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  Widget _getSelectedIcon(int index, currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManager.hollowCircleIc);
    } else {
      return SvgPicture.asset(AssetsManager.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final OnBoardContent _boardContent;

  const OnBoardingPage(this._boardContent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSizes.s40,
        ),
        Text(
          _boardContent.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: AppSizes.s20,
        ),
        Text(_boardContent.subTitle,
          style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center
        ),
        const SizedBox(
          height: AppSizes.s40,
        ),
        SvgPicture.asset(_boardContent.image),
      ],
    );
  }
}
