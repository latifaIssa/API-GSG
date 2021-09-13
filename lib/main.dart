import 'package:api_gsg/data/db_helper.dart';
import 'package:api_gsg/providers/myprovider.dart';
import 'package:api_gsg/ui/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper.dbHelper.initDatabase();
  runApp(ChangeNotifierProvider<HomeProvider>(
    create: (context) => HomeProvider(),
    child: MaterialApp(
      home: SplachScreen(),
    ),
  ));
}
