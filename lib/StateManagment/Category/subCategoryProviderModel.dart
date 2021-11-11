import 'package:a_m_s/Models/Category/subCategoryApiModel.dart';
import 'package:a_m_s/StateManagment/Products/productsProviderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:a_m_s/API/Category/categoryApiManager.dart';
import 'package:provider/provider.dart';

class SubCategoryProviderModel extends ChangeNotifier {
  List<SubCategoryModel> _listOfCategory = [];
  String _selectedSubCategoryId = "0";

  setSelectedSubCategoryId(BuildContext context, String categoryId) {
    _selectedSubCategoryId = categoryId;
    // to refresh to products
    final productProviderModel =
        Provider.of<ProductsProviderModel>(context, listen: false);
    productProviderModel.refreshProducts();
    notifyListeners();
  }

  String getSelectedSubCategoryId() => _selectedSubCategoryId;

  Future<List<SubCategoryModel>> getSubCategories(BuildContext context) async {
    if (_listOfCategory.length == 0) {
      _listOfCategory = await getSubCategoryFromAPI();
      if (_listOfCategory.length > 0) {
        _selectedSubCategoryId = _listOfCategory[0].catId;
        final productProviderModel =
            Provider.of<ProductsProviderModel>(context, listen: false);
        productProviderModel.refreshProducts();
      }
    }

    return _listOfCategory;
  }
  //getCategoryFromAPI
}
