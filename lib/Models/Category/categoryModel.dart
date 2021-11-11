// class CategoryApiResponseModel {
//   String responseFlag = "";
//   String responseMessage = "";
//   List<CategoryModel> data = [];

//   CategoryApiResponseModel(this.responseFlag, this.responseMessage, this.data);

//   CategoryApiResponseModel.fromJson(Map<String, dynamic> json) {
//     responseFlag = json['RESPONSE_FLAG'];
//     responseMessage = json['RESPONSE_MESSAGE'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data.add(new CategoryModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['RESPONSE_FLAG'] = this.responseFlag;
//     data['RESPONSE_MESSAGE'] = this.responseMessage;
//     data['data'] = this.data.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

// class CategoryModel {
//   String catId = "";
//   String catName = "";
//   String catIcon = "";
//   String catBanner = "";

//   CategoryModel(this.catId, this.catName, this.catIcon, this.catBanner);

//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     catId = json['cat_id'];
//     catName = json['cat_name'];
//     catIcon = json['cat_icon'];
//     catBanner = json['cat_banner'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cat_id'] = this.catId;
//     data['cat_name'] = this.catName;
//     data['cat_icon'] = this.catIcon;
//     data['cat_banner'] = this.catBanner;
//     return data;
//   }
// }
