import 'package:api_gsg/data/api_helper.dart';
import 'package:api_gsg/models/product_responsel.dart';
import 'package:api_gsg/providers/myprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body:
          Center(child: Consumer<HomeProvider>(builder: (context, provider, x) {
        return Container(
          child: RaisedButton(
            onPressed: () async {
              //////get all categories//////
              provider.getAllCategories();
              print(provider.allCategories);

              ////get all products/////
              provider.getAllProducts();
              print(provider.allProducts);

              /////////get specific product by id///////
              provider.getSelectedProduct(1);
              Product product = provider.selectedProduct;
              if (product.toJson() == null)
                print('null');
              else
                print(product.category);

              ////get all product for specific category/////
              provider.getCategoryProducts('electronics');
              print(provider.categoryProducts);
            },
          ),
        );
      })),
    );
  }
}
