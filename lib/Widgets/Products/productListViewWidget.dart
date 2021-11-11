import 'package:flutter/material.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:a_m_s/Pages/Product/productDetailPage.dart';

import '../imageWidget.dart';

class ProductListViewWidget extends StatelessWidget {
  final ProductModel productListModel;
  const ProductListViewWidget(this.productListModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductDetailPage(productListModel),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Image.network(productListModel.bigImage),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productListModel.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      productListModel.subtitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
