import 'package:a_m_s/Models/Category/subCategoryApiModel.dart';
import 'package:a_m_s/StateManagment/Category/subCategoryProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                        child: Text('Error occur while downloading Category.'));
                  } else if (snapshot.data?.length == 0) {
                    return Center(child: Text("No Category found."));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            myModel.setSelectedSubCategoryId(
                                context, snapshot.data![index].catId);
                            print("Selected Category Id " +
                                snapshot.data![index].catId.toString());
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  snapshot.data![index].catName,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color:
                                          myModel.getSelectedSubCategoryId() ==
                                                  snapshot.data![index].catId
                                              ? Color.fromRGBO(255, 255, 255, 1)
                                              : Colors.black,
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.12999999523162842),
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ],
                                  color: myModel.getSelectedSubCategoryId() ==
                                          snapshot.data![index].catId
                                      ? Color.fromRGBO(253, 33, 33, 1)
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
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
    );
  }
}
