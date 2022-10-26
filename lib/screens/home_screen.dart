
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:support/core/data_provider/local/cache_helper.dart';
import 'package:support/provider/control_provider.dart';
import 'package:support/provider/product_provider.dart';
import 'package:support/screens/Login.dart';


import '../core/constants/constant.dart';
import '../provider/auth_provider.dart';


class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Our Products'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {

                // setState(() {
                    Provider.of<AuthProvider>(context, listen: false).SignOut();


                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                            (route) => true);
               //   });
                //  Get.to(()=>LoginScreen());


                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Logout'),
                  ],
                ),
              ),
            ];
          })
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context,provider,child){
          return provider.ProductList.length==0? Center(child: CircularProgressIndicator(),):ListView.builder(itemBuilder: (context,index){
            return Card(
              elevation: 5,
              child: Container(
                  //color: Colors.white,
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
                 // elevation: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(provider.ProductList[index].image ,fit: BoxFit.fill, )),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                         mainAxisAlignment:MainAxisAlignment.center ,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           SizedBox(height: 40,),
                            Text(provider.ProductList[index].title,style: TextStyle(color: Colors.black,fontSize: 20),),
                            SizedBox(height: 30,),
                            Text("Price: ${provider.ProductList[index].price} eg",style: TextStyle(color: Colors.black,fontSize: 20),)
                          ],
                        ),
                      ))
                    ],
                  )
              ),
            );
          },itemCount: provider.ProductList.length,
          );;
        },
      ),
    );
  }
}