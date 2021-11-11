import 'dart:convert';

import 'package:a_m_s/Models/Promotions/promotionsModel.dart';

import '../apiRoutes.dart';
import '../httpClient.dart';

Future<List<PromotionBannerModel>> getPromotionsFromAPI() async {
  try {
    var response = await getHttpCall(
      APIRoute.getPromotionsURL(),
    );

    print("getPromotionsFromAPI() " +
        response.statusCode.toString() +
        "Body " +
        response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var parseResponse = PromotionBannersApiModel.fromJson(jsonData);
      return parseResponse.data;
    } else {
      return [];
    }
  } catch (ex) {
    print("Exception while getPromotionsFromAPI()" + ex.toString());
    return [];
  }
}
