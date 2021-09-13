import 'package:api_gsg/providers/myprovider.dart';
import 'package:api_gsg/ui/main_page.dart';
import 'package:api_gsg/ui/widges/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getAllCategories();
    Provider.of<HomeProvider>(context, listen: false).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MainPage();
      }));
    });
    // TODO: implement build
    return Scaffold(
      body: Center(child: FlutterLogo()),
    );
  }
}
