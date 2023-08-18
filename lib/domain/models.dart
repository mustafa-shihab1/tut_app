/// ****************************** [OnBoarding Model] ****************************** ///
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

/// ****************************** [Login Model] ****************************** ///
class Customer{
  int id;
  String name;
  String numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts{
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication{
  Customer customer;
  Contacts contacts;

  Authentication(this.customer, this.contacts);
}