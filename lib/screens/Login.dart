import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController _username=TextEditingController();
  TextEditingController _password=TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          //      borderRadius: BorderRadius.only(topLeft:Radius.circular(55) ,topRight: Radius.circular(55)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurpleAccent.withOpacity(0.5),
                  Colors.deepPurpleAccent.withOpacity(0.3),
                  Colors.deepPurpleAccent.withOpacity(0.1),
                  Colors.deepPurpleAccent.withOpacity(0.1),
                  Colors.deepPurpleAccent.withOpacity(0.3),
                  Colors.deepPurpleAccent.withOpacity(0.5),
                  //  Colors.deepPurpleAccent.withOpacity(0.1),

                ])),
        child: Center(
          child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextFormField(
                        controller: _username,
                        decoration:const InputDecoration(
                            border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            labelText: 'username'
                        ),
                        validator: (value){
                          if(value==null||value.isEmpty) {
                            return 'Enter your username';
                          }
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        controller: _password,
                        decoration:const InputDecoration(
                            border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            labelText: 'password'
                        ),
                        validator: (value){
                          if(value==null||value.isEmpty) {
                            return 'Enter your password';
                          }
                        },
                      ),
                      ElevatedButton(onPressed: ()async{
                        if(formkey.currentState!.validate()){


                          Provider.of<AuthProvider>(context, listen: false).getAuth(_username.text.toString(), _password.text.toString());
                        }
                      }, child:const Text("Sign in"), style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),)
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
