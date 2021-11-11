import 'package:flutter/cupertino.dart';
import 'package:a_m_s/API/Promotions/promotionsApiManager.dart';
import 'package:a_m_s/Models/Promotions/promotionsModel.dart';

class PromotionsProviderModel extends ChangeNotifier {
  List<PromotionBannerModel> _list = [];
  String _selectedCategoryId = "0";

  setSelectedCategoryId(String categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  int getLengthOfPromotions() => _list.length;
  String getSelectedCategoryId() => _selectedCategoryId;

  Future<List<PromotionBannerModel>> getPRomotions() async {
    if (_list.length == 0) {
      _list = await getPromotionsFromAPI();
    }
    return _list;
  }
  //getCategoryFromAPI
}
