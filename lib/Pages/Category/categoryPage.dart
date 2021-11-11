import 'package:a_m_s/Models/Category/subCategoryApiModel.dart';
import 'package:a_m_s/StateManagment/Category/subCategoryProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:a_m_s/Pages/Product/productListPage.dart';
import 'package:a_m_s/Widgets/backAndTitleWidget.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // for space only
          SizedBox(
            height: 60,
          ),
          // Back and Category Selection widget
          BackAndTitleWidget('Catogery Selection'),
          // List view
          Expanded(
            child: Consumer<SubCategoryProviderModel>(
              builder: (context, myModel, child) {
                return FutureBuilder<List<SubCategoryModel>>(
                  future: myModel.getSubCategories(context), // async work
                  builder: (BuildContext context,
                      AsyncSnapshot<List<SubCategoryModel>> snapshot) {
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
                          return Center(child: Text("No brands found."));
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  myModel.setSelectedSubCategoryId(
                                      context, snapshot.data![index].catId);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ProductListPage()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                        color: Colors.black38,
                                      )),
                                    ),
                                    child: ListTile(
                                      leading: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Text(
                                          snapshot.data![index].catName,
                                          style: TextStyle(fontSize: 19),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
