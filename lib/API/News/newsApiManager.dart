import 'dart:convert';
import 'package:a_m_s/Models/News/newsApiModel.dart';
import '../apiRoutes.dart';
import '../httpClient.dart';

Future<List<NewsModel>> getNewsFromAPI() async {
  try {
    String url = APIRoute.getNewsURL();
    // if (searchText != "") {
    //   url += "?keyword=" + searchText;
    // }
    var response = await getHttpCall(url);

    print("getNewsFromAPI() " +
        response.statusCode.toString() +
        "Body " +
        response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var parseResponse = NewsApiModel.fromJson(jsonData);
      return parseResponse.data;
    } else {
      return [];
    }
  } catch (ex) {
    print("Exception while getNewsFromAPI()" + ex.toString());
    return [];
  }
}
