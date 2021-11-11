class SubCategoryApiModel {
  String reponseFlag = "";
  String responseMessage = "";
  Data? data;

  SubCategoryApiModel(this.reponseFlag, this.responseMessage, this.data);

  SubCategoryApiModel.fromJson(Map<String, dynamic> json) {
    reponseFlag = json['RESPONSE_FLAG'];
    responseMessage = json['RESPONSE_MESSAGE'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RESPONSE_FLAG'] = this.reponseFlag;
    data['RESPONSE_MESSAGE'] = this.responseMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<SubCategoryModel> subCat = [];

  Data(this.subCat);

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sub_cat'] != null) {
      subCat = [];
      json['sub_cat'].forEach((v) {
        subCat.add(new SubCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_cat'] = this.subCat.map((v) => v.toJson()).toList();
    return data;
  }
}

class SubCategoryModel {
  String catId = "";
  String catName = "";
  String parentId = "";
  String catIcon = "";
  String catBanner = "";
  String sidebarSetting = "";

  SubCategoryModel(this.catId, this.catName, this.parentId, this.catIcon,
      this.catBanner, this.sidebarSetting);

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    parentId = json['parent_id'];
    catIcon = json['cat_icon'];
    catBanner = json['cat_banner'] ?? "";
    sidebarSetting = json['sidebar_setting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['parent_id'] = this.parentId;
    data['cat_icon'] = this.catIcon;
    data['cat_banner'] = this.catBanner;
    data['sidebar_setting'] = this.sidebarSetting;
    return data;
  }
}
