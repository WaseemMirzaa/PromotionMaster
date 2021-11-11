class ContactUsApiResponseModel {
  String responseFlag = "";
  String responseMessage = "";

  ContactUsApiResponseModel(this.responseFlag, this.responseMessage);

  ContactUsApiResponseModel.fromJson(Map<String, dynamic> json) {
    responseFlag = json['RESPONSE_FLAG'];
    responseMessage = json['RESPONSE_MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RESPONSE_FLAG'] = this.responseFlag;
    data['RESPONSE_MESSAGE'] = this.responseMessage;
    return data;
  }
}
