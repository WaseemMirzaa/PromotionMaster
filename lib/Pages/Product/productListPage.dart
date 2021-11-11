import 'package:a_m_s/Models/Products/productApiModel.dart';
import 'package:flutter/material.dart';
import 'package:a_m_s/StateManagment/Products/productsProviderModel.dart';
import 'package:a_m_s/Widgets/Products/homeProductGridViewWidget.dart';
import 'package:a_m_s/Widgets/Products/productListViewWidget.dart';
import 'package:a_m_s/Widgets/searchBoxWidget.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProviderModel>(
      builder: (context, myModel, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, size: 25),
                      ),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Search',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Quicksand',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBoxWidget(),
                Expanded(
                  child: FutureBuilder<List<ProductModel>>(
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
                            return Column(
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
                                            color:
                                                myModel.getIsListView() == false
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
                                           // Icons.grid_view_outlined,
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
                                Expanded(
                                  child: myModel.getIsListView()
                                      ? ListView.separated(
                                          itemCount: snapshot.data!.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  const Divider(
                                            thickness: 3,
                                          ),
                                          itemBuilder: (context, index) {
                                            return ProductListViewWidget(
                                                snapshot.data![index]);
                                          },
                                        )
                                      : HomeProductGridViewWidget(
                                          snapshot.data!),
                                ),
                              ],
                            );
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
