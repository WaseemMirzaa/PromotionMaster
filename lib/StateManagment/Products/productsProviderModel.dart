import 'package:a_m_s/StateManagment/Category/subCategoryProviderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:a_m_s/API/Products/productApiManager.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:provider/provider.dart';

class ProductsProviderModel extends ChangeNotifier {
  List<ProductModel> _list = [];
  String _searchText = "";
  bool _isListView = true;

  setSearchTexbox(String text) {
    _searchText = text;
  }

  String getSearchText() => _searchText;
  refreshProducts() {
    notifyListeners();
  }

  Future<List<ProductModel>> getProducts(
      BuildContext context, bool isRefresh) async {
    final categoryProviderModel =
        Provider.of<SubCategoryProviderModel>(context, listen: false);
    if (categoryProviderModel.getSelectedSubCategoryId() != "0") {
      if (_list.length == 0 || isRefresh) {
        _list = await getProductsFromAPI(
            _searchText, categoryProviderModel.getSelectedSubCategoryId());
      }
    }

    return _list;
  }

  setIsListView(bool val) {
    _isListView = val;
    notifyListeners();
  }

  bool getIsListView() => _isListView;
}
