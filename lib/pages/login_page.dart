import 'package:flutter/material.dart';
import 'package:my_flutter_project/Model/user_model.dart';
import 'package:my_flutter_project/service/prefs_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _controller;
  TextEditingController? _password;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    _password= TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller?.dispose();
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
                  Container(

                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/4957136.jpg'
                        ),

                      )
                    ),


                  ),
                  SizedBox(
                    height: 5,
                  ),
              Text("Welcome back!" ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 5,
              ),
              Text("Log in to your existant account of Q Allure" ,style: TextStyle(fontSize: 14,color: Colors.grey),),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.blue,),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password,color: Colors.blue,),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  labelText: 'password',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(onPressed: (){
                var user = User(_controller.toString(),_password.toString() );
                PrefService.storeUser(user);
                PrefService.loadUser().then((value)=>{
                  print(value!.toJson().toString())
                });

              },
                child: Container(

                  padding: EdgeInsets.only(top: 5,bottom: 5,left: 40,right: 40),
                  child: Text("Log In" ,style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    border: Border.all(color: Colors.indigo, width: 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

              ),
              SizedBox(
                height: 15,
              ),
              Text("Or connect using" ,style: TextStyle(fontSize: 14,color: Colors.grey),),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  MaterialButton(onPressed: (){},
                    child: Container(

                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                      child: Row(
                        children: [
                          Icon(Icons.facebook , color: Colors.white,),
                          SizedBox(
                            width: 5,
                          ),
                          Text("facebook" ,style: TextStyle(color: Colors.white ,fontSize: 12),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        border: Border.all(color: Colors.indigo, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                  ),
                  MaterialButton(onPressed: (){},
                    child: Container(

                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                      child: Row(

                        children: [
                          Icon(Icons.g_mobiledata_rounded , color: Colors.white,),
                          SizedBox(
                            width: 5,
                          ),
                          Text("google" ,style: TextStyle(color: Colors.white,fontSize: 12),),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?" ,style: TextStyle(fontSize: 14,color: Colors.black),),
                  Text("Sign Up" ,style: TextStyle(fontSize: 14,color: Colors.blue),),
                ],
              ),
            ],
          ),
        )
      ) ,
    );
  }
}
