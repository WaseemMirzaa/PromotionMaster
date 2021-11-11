import 'package:flutter/material.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:a_m_s/Pages/Product/productDetailPage.dart';
import 'package:a_m_s/Widgets/Products/productListViewWidget.dart';

class HomeProductListViewWidget extends StatelessWidget {
  final List<ProductModel> productList;
  const HomeProductListViewWidget(this.productList, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ProductDetailPage(productList[index])));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductListViewWidget(productList[index]),
            ),
          );
        });
  }
}
