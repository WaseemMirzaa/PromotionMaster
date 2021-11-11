import 'package:a_m_s/Pages/UsersList/UsersList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:a_m_s/Pages/Category/categoryPage.dart';
import 'package:a_m_s/Pages/Product/productListPage.dart';
import 'package:a_m_s/StateManagment/Products/productsProviderModel.dart';
import 'package:a_m_s/Widgets/Home/categoryListWidget.dart';
import 'package:a_m_s/Widgets/Products/homeProductGridViewWidget.dart';
import 'package:a_m_s/Widgets/Products/homeProductListViewWidget.dart';
import 'package:a_m_s/Widgets/Promotions/homePromotionWidget.dart';
import 'package:a_m_s/Widgets/searchBoxWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSizeBox(60),
              // Home
              Row(
                children: [
                  Text(
                    'Home',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Quicksand',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      'Chat',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Quicksand',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => UsersList()),
                      );
                    },
                  )
                ],
              ),
              getSizeBox(30),
              // Search text box
              SearchBoxWidget(),
              getSizeBox(30),
              // Promotion List
              HomePromotionWidget(),
              getSizeBox(30),
              // Category and View All Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Quicksand',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CategoryPage()),
                      );
                    },
                    child: Text(
                      'View All',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  )
                ],
              ),
              getSizeBox(30),
              // Category List
              CategoryListWidget(),
              getSizeBox(10),
              //Products
              Consumer<ProductsProviderModel>(
                builder: (context, myModel, child) {
                  return FutureBuilder<List<ProductModel>>(
                    future: myModel.getProducts(context, true), // async work
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProductModel>> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          if (snapshot.hasError)
                            return Center(
                                child: Text(
                                    'Error occur while downloading Products.'));
                          else if (snapshot.data?.length == 0) {
                            return Center(child: Text("No Products found."));
                          } else {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 1.2,
                              child: Column(
                                children: [
                                  // View Products,List and Grid view icons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                          child: Container(
                                            child: Text(
                                              "View Products",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ProductListPage()),
                                            );
                                          }),
                                      // List View Icon
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            myModel.setIsListView(true);
                                          },
                                          child: Container(
                                            child: Icon(
                                              Icons.list_outlined,
                                              size: 40,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),
                                                topRight: Radius.circular(3),
                                                bottomLeft: Radius.circular(3),
                                                bottomRight: Radius.circular(3),
                                              ),
                                              color: myModel.getIsListView() ==
                                                      false
                                                  ? Colors.grey.shade600
                                                  : Color.fromRGBO(
                                                      253, 33, 33, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Grid View Icon
                                      GestureDetector(
                                        onTap: () {
                                          myModel.setIsListView(false);
                                        },
                                        child: Container(
                                            child: Icon(
                                              Icons.grid_view,
                                              size: 40,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(3),
                                                topRight: Radius.circular(3),
                                                bottomLeft: Radius.circular(3),
                                                bottomRight: Radius.circular(3),
                                              ),
                                              color: myModel.getIsListView()
                                                  ? Colors.grey.shade600
                                                  : Color.fromRGBO(
                                                      253, 33, 33, 1),
                                            )),
                                      ),
                                    ],
                                  ),
                                  myModel.getIsListView()
                                      ? Expanded(
                                          child: HomeProductListViewWidget(
                                              snapshot.data!),
                                        )
                                      : Expanded(
                                          child: HomeProductGridViewWidget(
                                              snapshot.data!),
                                        ),
                                ],
                              ),
                            );
                          }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSizeBox(double sizedBoxHeight) {
    return SizedBox(
      height: sizedBoxHeight,
    );
  }
}
