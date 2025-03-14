
class OnBoardContent {
  String title;
  String subTitle;
  String image;

  OnBoardContent(this.title, this.subTitle, this.image);
}
class OnBoardContentView{
  OnBoardContent onBoardContent;
  int sliderLength;
  int currentSliderNumber;
  OnBoardContentView(this.onBoardContent,this.currentSliderNumber,this.sliderLength);
}