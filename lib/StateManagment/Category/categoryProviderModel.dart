// import 'package:a_m_s/StateManagment/Products/productsProviderModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:a_m_s/API/Category/categoryApiManager.dart';
// import 'package:a_m_s/Models/Category/categoryModel.dart';
// import 'package:provider/provider.dart';

// class CategoryProviderModel extends ChangeNotifier {
//   List<CategoryModel> _listOfCategory = [];
//   String _selectedCategoryId = "0";

//   setSelectedCategoryId(BuildContext context, String categoryId) {
//     _selectedCategoryId = categoryId;
//     // to refresh to products
//     final categoryProviderModel =
//         Provider.of<ProductsProviderModel>(context, listen: false);
//     categoryProviderModel.refreshProducts();
//     notifyListeners();
//   }

//   String getSelectedCategoryId() => _selectedCategoryId;

//   Future<List<CategoryModel>> getCategories() async {
//     if (_listOfCategory.length == 0) {
//       _listOfCategory = await getCategoryFromAPI();
//       _listOfCategory.insert(0, new CategoryModel("", "All", "", ""));
//       if (_listOfCategory.length > 0) {
//         _selectedCategoryId = _listOfCategory[0].catId;
//       }
//     }

//     return _listOfCategory;
//   }
//   //getCategoryFromAPI
// }
