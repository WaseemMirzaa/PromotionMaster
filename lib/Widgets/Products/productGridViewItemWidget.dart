import 'package:flutter/material.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';

import '../imageWidget.dart';

class ProductGridViewItemWidget extends StatelessWidget {
  final ProductModel productListModel;
  const ProductGridViewItemWidget(this.productListModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(productListModel.bigImage),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
            ),
          ),

          //Title
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  productListModel.name,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
          ),

          // subtitle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  productListModel.subtitle,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(253, 33, 33, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12999999523162842),
              offset: Offset(2, 2),
              blurRadius: 3)
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: Color.fromRGBO(242, 242, 242, 1),
          width: 1,
        ),
      ),
    );
  }
}
