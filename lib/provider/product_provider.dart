import 'package:flutter/cupertino.dart';
import 'package:support/core/data_provider/local/cache_helper.dart';
import 'package:support/core/data_provider/remote/dio_helper.dart';
import 'package:support/model/product_model.dart';

import '../core/constants/constant.dart';

class ProductProvider extends ChangeNotifier {

  List<ProductModel> ProductList = [];


  ProductProvider(){
    getAllProduts();
  }

  Future getAllProduts() async {
    try
    {
      DioHelper.getData(endpoint: HOME, token: CacheHelper.getData(ACCESSTOKEN)).then((value) {
        ProductList = List<ProductModel>.from(
            value!.data["products"].map((x) => ProductModel.fromJson(x)));
        notifyListeners();
      });


    }
    catch(e){
      print(e);
    }
  }


}