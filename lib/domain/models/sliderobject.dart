class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

class SliderViewObject {
  SliderObject sliderobject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderobject,
    required this.numberOfSlides,
    required this.currentIndex,
  });
}
