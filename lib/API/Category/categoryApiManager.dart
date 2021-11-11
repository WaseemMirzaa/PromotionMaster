import 'dart:convert';

import 'package:a_m_s/Models/Category/subCategoryApiModel.dart';

import '../apiRoutes.dart';
import '../httpClient.dart';

// Future<List<CategoryModel>> getCategoryFromAPI() async {
//   try {
//     var response = await getHttpCall(
//       APIRoute.getCategoryURL(),
//     );

//     print("getCategoryFromAPI() " +
//         response.statusCode.toString() +
//         "Body " +
//         response.body);

//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       var parseResponse = CategoryApiResponseModel.fromJson(jsonData);
//       return parseResponse.data;
//     } else {
//       return [];
//     }
//   } catch (ex) {
//     print("Exception while getCategoryFromAPI()" + ex.toString());
//     return [];
//   }
// }

Future<List<SubCategoryModel>> getSubCategoryFromAPI() async {
  try {
    var response = await getHttpCall(
      APIRoute.getSubCategoryURL(),
    );

    print("getSubCategoryFromAPI() " +
        response.statusCode.toString() +
        "Body " +
        response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var parseResponse = SubCategoryApiModel.fromJson(jsonData);
      return parseResponse.data!.subCat;
    } else {
      return [];
    }
  } catch (ex) {
    print("Exception while getSubCategoryFromAPI()" + ex.toString());
    return [];
  }
}
