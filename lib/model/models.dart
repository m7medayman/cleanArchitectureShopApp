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

// Api Class
class ApiResponse {}

class Customer extends ApiResponse {
  String id;
  String name;
  int numOfNotifications;
  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts extends ApiResponse {
  String phone;
  String email;
  String link;
  Contacts(this.email, this.link, this.phone);
}

class Authentication extends ApiResponse {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.contacts, this.customer);
}

class ApiMessage extends ApiResponse {
  int? statusCode;
  String? message;
  ApiMessage(this.statusCode, this.message);
}

// Request Class
abstract class Request {}

class EmailRequest extends Request {
  String email;
  EmailRequest(this.email);
}

class CodeRequest extends Request {
  String code;
  CodeRequest(this.code);
}

class LoginRequest extends Request {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}
