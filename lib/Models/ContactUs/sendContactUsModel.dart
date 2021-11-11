class SendContactUsModel {
  String name = "";
  String email = "";
  String contactUs = "";
  String message = "";

  SendContactUsModel(this.name, this.email, this.contactUs, this.message);

  SendContactUsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    contactUs = json['contact_us'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact_us'] = this.contactUs;
    data['message'] = this.message;
    return data;
  }
}
