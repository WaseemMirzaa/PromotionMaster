class PromotionBannersApiModel {
  String responseFlag = "";
  String responseMessage = "";
  List<PromotionBannerModel> data = [];

  PromotionBannersApiModel(this.responseFlag, this.responseMessage, this.data);

  PromotionBannersApiModel.fromJson(Map<String, dynamic> json) {
    responseFlag = json['RESPONSE_FLAG'];
    responseMessage = json['RESPONSE_MESSAGE'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new PromotionBannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RESPONSE_FLAG'] = this.responseFlag;
    data['RESPONSE_MESSAGE'] = this.responseMessage;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class PromotionBannerModel {
  String id = "";
  String title = "";
  String banner = "";
  String link = "";

  PromotionBannerModel(this.id, this.title, this.banner, this.link);

  PromotionBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    banner = json['banner'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['banner'] = this.banner;
    data['link'] = this.link;
    return data;
  }
}
