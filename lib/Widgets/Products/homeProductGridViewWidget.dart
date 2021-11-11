import 'package:flutter/material.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:a_m_s/Pages/Product/productDetailPage.dart';
import 'package:a_m_s/Widgets/Products/productGridViewItemWidget.dart';

class HomeProductGridViewWidget extends StatelessWidget {
  final List<ProductModel> productList;
  const HomeProductGridViewWidget(this.productList, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.80,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
      children: List.generate(
        productList.length,
        (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductDetailPage(productList[index]),
                ),
              );
            },
            child: Container(
              child: ProductGridViewItemWidget(productList[index]),
            ),
          );
        },
      ),
    );
  }
}
