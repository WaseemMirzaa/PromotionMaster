import 'package:flutter/cupertino.dart';
import 'package:a_m_s/API/News/newsApiManager.dart';
import 'package:a_m_s/Models/News/newsApiModel.dart';

class NewsProviderModel extends ChangeNotifier {
  List<NewsModel> _list = [];
  String _searchText = "";

  setSearchTexbox(String text) {
    _searchText = text;
  }

  String getSearchText() => _searchText;

  fetchNewsSearchRecords() {
    notifyListeners();
  }

  List<NewsModel> getNewsList() => _list;

  Future<List<NewsModel>> getNews(bool isRefresh) async {
    if (_list.length == 0 || isRefresh) {
      _list = await getNewsFromAPI();
    }
    return _list;
  }
}
