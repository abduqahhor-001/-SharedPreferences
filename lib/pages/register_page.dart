import 'package:flutter/material.dart';
import 'package:my_flutter_project/Model/newUser.dart';
import 'package:my_flutter_project/service/secure_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? _username;
  TextEditingController? _email;
  TextEditingController? _phone;
  TextEditingController? _password;
  @override
  void initState() {
    // TODO: implement initState
    _username = TextEditingController();
    _password= TextEditingController();
    _phone = TextEditingController();
    _email= TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _username?.dispose();
    _email?.dispose();
    _phone?.dispose();
    _password?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(

          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child:  Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("Let's get Started!" ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                Text("Create an account to Q Allure to get all features" ,style: TextStyle(fontSize: 14,color: Colors.grey),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.blue,),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    labelText: 'user name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password,color: Colors.blue,),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    labelText: 'email',
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.blue,),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    labelText: 'phone',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller:_password ,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.blue,),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    labelText: 'password',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.blue,),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    labelText: 'Coniform Password',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(onPressed: () async {
                  var user = newUser(
                     _email.toString(),
                 _password.toString(),
                    _phone.toString(),
                   _username.toString(),
                  );

                  await SecureService.storeUser(user);

                  newUser? loadedUser = await SecureService.loadUser();
                  if (loadedUser != null) {
                    print(loadedUser.toJson().toString());
                  } else {
                    print('Failed to load user.');
                  }
                },


                  child: Container(

                    padding: EdgeInsets.only(top: 5,bottom: 5,left: 40,right: 40),
                    child: Text("Create" ,style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      border: Border.all(color: Colors.indigo, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                ),


                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?" ,style: TextStyle(fontSize: 14,color: Colors.black),),
                    Text("Login here" ,style: TextStyle(fontSize: 14,color: Colors.blue),),
                  ],
                ),
              ],
            ),
          )
      ) ,
    );
  }
}
