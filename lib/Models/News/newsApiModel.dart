class NewsApiModel {
  String responseFlag = "";
  String responseMessage = "";
  List<NewsModel> data = [];

  NewsApiModel(this.responseFlag, this.responseMessage, this.data);

  NewsApiModel.fromJson(Map<String, dynamic> json) {
    responseFlag = json['RESPONSE_FLAG'];
    responseMessage = json['RESPONSE_MESSAGE'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new NewsModel.fromJson(v));
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

class NewsModel {
  String newsId = "";
  String newsTitle = "";
  String newsSlug = "";
  String newsContent = "";
  String image = "";
  String publishDate = "";
  String draft = "";
  String pdfFile = "";

  NewsModel(this.newsId, this.newsTitle, this.newsSlug, this.newsContent,
      this.image, this.publishDate, this.draft, this.pdfFile);

  NewsModel.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    newsTitle = json['news_title'];
    newsSlug = json['news_slug'];
    newsContent = json['news_content'];
    image = json['image'];
    publishDate = json['publish_date'];
    draft = json['draft'];
    pdfFile = json['pdf_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['news_title'] = this.newsTitle;
    data['news_slug'] = this.newsSlug;
    data['news_content'] = this.newsContent;
    data['image'] = this.image;
    data['publish_date'] = this.publishDate;
    data['draft'] = this.draft;
    data['pdf_file'] = this.pdfFile;
    return data;
  }
}
