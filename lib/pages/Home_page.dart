import 'package:flutter/material.dart';
import 'package:my_flutter_project/service/prefs_service.dart';
import 'package:my_flutter_project/service/secure_service.dart';

import '../Model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "dssds";
  @override
  void initState() {

  SecureService.storeApiKey("2e440ddfbb78d5330c419783d3cc88fc");
  SecureService.loadApiKey().then((value)=>{
    print(value)
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('shared preferences'),
        centerTitle: true,
      ),

      body: Center(
        child: Text(result),
      ),
    );
  }
}
