import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:a_m_s/Models/Promotions/promotionsModel.dart';
import 'package:a_m_s/StateManagment/Promotions/promotionsProviderModel.dart';
import 'package:provider/provider.dart';

import '../imageWidget.dart';

class HomePromotionWidget extends StatelessWidget {
  const HomePromotionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List view
    return Consumer<PromotionsProviderModel>(
      builder: (context, myModel, child) {
        return FutureBuilder<List<PromotionBannerModel>>(
          future: myModel.getPRomotions(), // async work
          builder: (BuildContext context,
              AsyncSnapshot<List<PromotionBannerModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError)
                  return Center(
                      child: Text('Error occur while downloading promotions.'));
                else if (snapshot.data?.length == 0) {
                  return Center(child: Text("No brands promotions."));
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2)),
                      items: snapshot.data!
                          .map((promotionModel) => Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25.0, top: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      promotionModel.title,
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        promotionModel.link,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                    promotionModel.banner),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }
            }
          },
        );
      },
    );
  }
}
