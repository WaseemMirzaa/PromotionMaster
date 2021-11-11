class APIRoute {
  static String _baseUrl = "https://ptcbrunei.com/api/";
  static String _getCategory = "inventory/categories";
  static String _getPromotions = "inventory/promotion_banners";
  static String _getProducts = "inventory/products_list";
  static String _getNews = "inventory/news";
  static String _getSubCategory = "inventory/sub_categories?cat_id=28";
  static String _getContactUs = "inventory/contact";
  static String _postDeviceId = "inventory/deviceId";
  static String _postUserSignIn = "authentication/user_login";
  static String _postUserSignUp = "authentication/register";
  static String _authenticateEmail = "authentication/save_lucky_draw_email";

  static String getCategoryURL() => _baseUrl + _getCategory;
  static String getSubCategoryURL() => _baseUrl + _getSubCategory;
  static String getPromotionsURL() => _baseUrl + _getPromotions;
  static String getProductsURL() => _baseUrl + _getProducts;
  static String getNewsURL() => _baseUrl + _getNews;
  static String getContactUsURL() => _baseUrl + _getContactUs;
  static String postDeviceIdURL() => _baseUrl + _postDeviceId;
  static String postUserSignInURL() => _baseUrl + _postUserSignIn;

  static String postEmail() => _baseUrl + _authenticateEmail;
  static String postUserSignUpURL() => _baseUrl + _postUserSignUp;
}
