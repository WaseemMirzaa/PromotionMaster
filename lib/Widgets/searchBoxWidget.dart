import 'package:flutter/material.dart';
import 'package:a_m_s/StateManagment/Products/productsProviderModel.dart';
import 'package:provider/provider.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProviderModel>(
      builder: (context, myModel, child) {
        return Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    myModel.refreshProducts();
                  },
                  child: Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: TextField(
                  controller:
                      TextEditingController(text: myModel.getSearchText()),
                  onChanged: (val) {
                    myModel.setSearchTexbox(val);
                  },
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(94, 94, 94, 1),
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
