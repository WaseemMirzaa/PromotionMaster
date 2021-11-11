import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:a_m_s/Models/News/newsApiModel.dart';
import 'package:a_m_s/Pages/News/newsDetailsPage.dart';

import '../imageWidget.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel newsModel;
  const NewsCardWidget(this.newsModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Image
          Expanded(
            child: Container(
              child: CachedNetworkImage(
                imageUrl: newsModel.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
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
          ),
          // Title, Date, Content and read more
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Date
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Expanded(
                          child: Text(
                            newsModel.publishDate,
                            textAlign: TextAlign.left,
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
                  Expanded(
                    child: Text(
                      newsModel.newsContent,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Quicksand',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  // Read More
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewsDetailPage(newsModel)),
                          );
                        },
                        child: Text(
                          'Read more',
                          style: TextStyle(
                              color: Color.fromRGBO(253, 33, 33, 1),
                              fontFamily: 'Quicksand',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
