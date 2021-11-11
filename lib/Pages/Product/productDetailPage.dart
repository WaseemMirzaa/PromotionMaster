import 'package:a_m_s/Widgets/Products/shareYourProduct.dart';
import 'package:a_m_s/Widgets/imageWidget.dart';
import 'package:flutter/material.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel productDetailModel;
  ProductDetailPage(this.productDetailModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Back, Favorite and Image
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(242, 242, 242, 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      // Favorite
                      // CircleAvatar(
                      //   child: GestureDetector(
                      //     onTap: () {},
                      //     child: Icon(
                      //       Icons.favorite,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      //   backgroundColor: Colors.white70,
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.network(productDetailModel.bigImage),
                ),
              ],
            ),
          ),
          //Title
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    productDetailModel.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // share button
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        context: context,
                        builder: (context) {
                          return ShareYourProduct(productDetailModel);
                        });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Icon(Icons.share),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // subtitle
                SizedBox(
                  height: 26,
                  child: Text(
                    productDetailModel.subtitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                // Description
                Text(
                  productDetailModel.description,
                  maxLines: 5,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
