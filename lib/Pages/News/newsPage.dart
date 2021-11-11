import 'package:flutter/material.dart';
import 'package:a_m_s/Models/News/newsApiModel.dart';
import 'package:a_m_s/StateManagment/News/newsProviderModel.dart';
import 'package:a_m_s/Widgets/News/NewsCardWidget.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'News',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Quicksand',
                fontSize: 18,
                height: 1),
          ),
          Expanded(
            child: Consumer<NewsProviderModel>(
              builder: (context, myModel, child) {
                return FutureBuilder<List<NewsModel>>(
                  future: myModel.getNews(true), // async work
                  builder: (BuildContext context,
                      AsyncSnapshot<List<NewsModel>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      default:
                        if (snapshot.hasError)
                          return Center(
                              child:
                                  Text('Error occur while downloading News.'));
                        else if (snapshot.data?.length == 0) {
                          return Center(child: Text("No News found."));
                        } else {
                          return ListView.separated(
                            itemCount: myModel.getNewsList().length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              thickness: 3,
                            ),
                            itemBuilder: (context, index) {
                              return NewsCardWidget(
                                  myModel.getNewsList()[index]);
                            },
                          );
                        }
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
