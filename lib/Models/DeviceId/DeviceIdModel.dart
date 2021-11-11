class DeviceIdModel {
  // String device_id = "";
  // String customer_id = "";
  String email = "";
  // String phone_no = "";
  // int status = 1;

  DeviceIdModel(this.email);

  DeviceIdModel.fromJson(Map<String, dynamic> json) {
    // device_id = json['device_id'];
    // customer_id = json['customer_id'];
    email = json['email'];
    // phone_no = json['phone_no'];
    // status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['device_id'] = this.device_id;
    // data['customer_id'] = this.customer_id;
    data['email'] = this.email;
    // data['phone_no'] = this.phone_no;
    // data['status'] = this.status;
    return data;
  }
}
