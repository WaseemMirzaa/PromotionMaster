import 'dart:convert';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import '../apiRoutes.dart';
import '../httpClient.dart';

Future<List<ProductModel>> getProductsFromAPI(
    String searchText, String categoryId) async {
  try {
    String url = APIRoute.getProductsURL();
    if (searchText != "") {
      url += "?keyword=" + searchText;
    }
    if (categoryId != "") {
      url += "?cat_id=" + categoryId;
    }
    var response = await getHttpCall(url);

    print("getProductsFromAPI() " +
        response.statusCode.toString() +
        "Body " +
        response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var parseResponse = ProductsApiModel.fromJson(jsonData);
      if (parseResponse.data!.noProducts) {
        return [];
      }
      return parseResponse.data!.products;
    } else {
      return [];
    }
  } catch (ex) {
    print("Exception while getProductsFromAPI()" + ex.toString());
    return [];
  }
}
