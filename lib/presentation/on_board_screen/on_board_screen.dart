import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late final List<OnBoardContent> _list = getOnBoardDetails();

  List<OnBoardContent> getOnBoardDetails() => [
        OnBoardContent(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, AssetsManager.ontBoardLogo1),
        OnBoardContent(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, AssetsManager.ontBoardLogo2),
        OnBoardContent(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, AssetsManager.ontBoardLogo3),
        OnBoardContent(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, AssetsManager.ontBoardLogo4),
      ];
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
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
                    onPressed: () {},
                    child: Text(
                      AppStrings.skip,
                      style: Theme.of(context).textTheme.displayMedium,
                    )),
              ],
            ),
            const SizedBox(height: AppSizes.s10),
            Container(
              color: ColorManager.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p10),
                    child: SizedBox(
                      height: AppSizes.s20,
                      width: AppSizes.s20,
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AssetsManager.leftArrowIc),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < _list.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: _getSelectedIcon(i),
                        )
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: SizedBox(
                      height: AppSizes.s20,
                      width: AppSizes.s20,
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(AssetsManager.rightArrowIc),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _getSelectedIcon(int index){
    if (index==currentIndex){
      return SvgPicture.asset(AssetsManager.hollowCircleIc);
    }else {
      return SvgPicture.asset(AssetsManager.solidCircleIc);
    }
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
        Text(
          _boardContent.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSizes.s40,
        ),
        SvgPicture.asset(_boardContent.image),
      ],
    );
  }
}

class OnBoardContent {
  String title;
  String subTitle;
  String image;

  OnBoardContent(this.title, this.subTitle, this.image);
}
