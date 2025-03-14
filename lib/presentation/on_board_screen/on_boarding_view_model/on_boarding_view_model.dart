import 'dart:async';
import 'package:tut_app/domain/models.dart';
import 'package:tut_app/presentation/basic/basic_view_model.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/string_manager.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnBoardingViewModelInputs,
        OnBoardingViewModelOutputs {
  final StreamController<OnBoardContentView> _streamController =
      StreamController<OnBoardContentView>();
  int currentIndex = 0;
  late final List<OnBoardContent> _list;

  @override
  void start() {
    _list = getOnBoardDetails();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int nextPage() {
    int nextNumber = ++currentIndex;
    if (nextNumber == _list.length) {
      nextNumber = 0;
    }
    return nextNumber;
  }

  @override
  int previousPage() {
    int previousNumber = --currentIndex;
    if (previousNumber == -1) {
      previousNumber = _list.length - 1;
    }
    return previousNumber;
  }

  @override
  void onPageChange(int index) {
    currentIndex = index; // Correctly updates the current index
    _postDataToView();
  }

  @override
  Sink get inputOnBoard => _streamController.sink;

  @override
  Stream<OnBoardContentView> get outputOnBoard =>
      _streamController.stream.map((slider) => slider);

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

  void _postDataToView() {
    inputOnBoard.add(
        OnBoardContentView(_list[currentIndex], currentIndex, _list.length));
  }
}

abstract class OnBoardingViewModelInputs {
  int nextPage();

  int previousPage();

  void onPageChange(int index);

  Sink get inputOnBoard;
}

abstract class OnBoardingViewModelOutputs {
  Stream get outputOnBoard;
}
