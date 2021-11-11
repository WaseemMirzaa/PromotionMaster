class ProductsApiModel {
  String responseFlag = "";
  String responseMessage = "";
  Data? data;

  ProductsApiModel(this.responseFlag, this.responseMessage, this.data);

  ProductsApiModel.fromJson(Map<String, dynamic> json) {
    responseFlag = json['RESPONSE_FLAG'];
    responseMessage = json['RESPONSE_MESSAGE'];
    if (json['data'] != null) {
      this.data = Data.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RESPONSE_FLAG'] = this.responseFlag;
    data['RESPONSE_MESSAGE'] = this.responseMessage;
    data['data'] = this.data!.toJson();
    return data;
  }
}

class Data {
  bool noProducts = false;
  List<ProductModel> products = [];
  Data(this.noProducts, this.products);

  Data.fromJson(Map<String, dynamic> json) {
    noProducts = json['no_products'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RESPONSE_FLAG'] = this.noProducts;
    data['products'] = this.products.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductModel {
  String id = "";
  String name = "";
  String subtitle = "";
  String description = "";
  String catId = "";
  String catName = "";
  String pdfLink = "";
  String image = "";
  String smallImage = "";
  String bigImage = "";
  String shareLink = "";

  ProductModel(
      this.id,
      this.name,
      this.subtitle,
      this.description,
      this.catId,
      this.catName,
      this.pdfLink,
      this.image,
      this.smallImage,
      this.bigImage,
      this.shareLink);

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    shareLink = json['share_link'] ?? "";
    name = json['name'] ?? "";
    subtitle = json['subtitle'] ?? "";
    description = json['description'] ?? "";
    catId = json['cat_id'] ?? "";
    catName = json['cat_name'] ?? "";
    pdfLink = json['pdf_link'] ?? "";
    image = json['image'] ?? "";
    smallImage = json['small_image'] ?? "";
    bigImage = json['big_image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['share_link'] = this.shareLink;
    data['name'] = this.name;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['pdf_link'] = this.pdfLink;
    data['image'] = this.image;
    data['small_image'] = this.smallImage;
    data['big_image'] = this.bigImage;
    return data;
  }
}
