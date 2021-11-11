import 'package:a_m_s/Widgets/imageWidget.dart';
import 'package:flutter/material.dart';
import 'package:a_m_s/Models/News/newsApiModel.dart';
import 'package:a_m_s/Widgets/backAndTitleWidget.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetailPage(this.newsModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
          child: Column(
            children: [
              // Back and Category Selection widget
              BackAndTitleWidget('News'),
              SizedBox(
                height: 20,
              ),
              //Image
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Image.network(newsModel.image),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Color.fromRGBO(229, 229, 229, 1),
                ),
              ),

              // Title and Date
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Expanded(
                      flex: 2,
                      child: Text(
                        newsModel.newsTitle,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color.fromRGBO(35, 31, 32, 1),
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                    // DateTime
                    Expanded(
                      child: Text(
                        newsModel.publishDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(94, 94, 94, 1),
                            fontFamily: 'Quicksand',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    )
                  ],
                ),
              ),
              // Content
              Text(
                newsModel.newsContent,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Quicksand',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(height: 20),
              // download Icon
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.picture_as_pdf_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NewsDetailPage(newsModel)),
                        );
                      },
                      child: Text(
                        newsModel.publishDate,
                        style: TextStyle(
                            color: Color.fromRGBO(253, 33, 33, 1),
                            fontFamily: 'Quicksand',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
