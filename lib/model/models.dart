class SlidersView {
  SliderObject sliderObject;
  int sliderCount;
  int currentSlide;
  SlidersView(this.sliderObject, this.currentSlide, this.sliderCount);
}

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.image, this.subTitle, this.title);
}
