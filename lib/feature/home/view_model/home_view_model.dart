import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_shop_card/feature/home/model/address_model.dart';
import 'package:getx_shop_card/feature/home/model/category_model.dart';
import 'package:getx_shop_card/feature/home/model/product_model.dart';
import 'package:getx_shop_card/feature/home/view_model/state.dart';

import '../../../core/util.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel get controller => Get.find<HomeViewModel>();
  HomeState state = HomeState();

  initAllDate() async {
    if (state.productItem .isEmpty ||
        state.productItem.isEmpty ||
        state.addressItem .isEmpty){
      await fetchProduct();
      await fetchCategory();
      await fetchAddress();
    }

  }

  changeSelectIndex(index) {
    state.selectIndex = index;
    update();
  }

  Future<List<ProductModel>> fetchProduct() async {
    state.productStatus = ScreenStatus.loading;
    try {
      String response =
          await rootBundle.loadString('assets/mock_data/ProductModel.json');

      List<dynamic> result = json.decode(response);
      state.productStatus = ScreenStatus.loaded;
      state.productItem = result.map((n) => ProductModel.fromJson(n)).toList();
      return state.productItem;
    } catch (e) {
      state.productStatus = ScreenStatus.error;
      throw const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Convert Error'),
        ),
      );
    }
  }

  Future<List<CategoryModel>> fetchCategory() async {
    state.categoryState = ScreenStatus.loading;

    try {
      String response =
          await rootBundle.loadString('assets/mock_data/category.json');

      List<dynamic> result = json.decode(response);
      state.categoryState = ScreenStatus.loaded;
      state.categoryItem =
          result.map((n) => CategoryModel.fromJson(n)).toList();

      return state.categoryItem;
    } catch (e) {
      state.categoryState = ScreenStatus.error;

      throw const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Convert Error'),
        ),
      );
    }
  }

  Future<List<AddressModel>> fetchAddress() async {
    state.addressState = ScreenStatus.loading;
    try {
      String response =
          await rootBundle.loadString('assets/mock_data/addressModel.json');
      List<dynamic> result = json.decode(response);
      state.addressState = ScreenStatus.loaded;
      state.addressItem = result.map((n) => AddressModel.fromJson(n)).toList();
      return state.addressItem;
    } catch (e) {
      state.addressState = ScreenStatus.error;
      throw const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Convert Error'),
        ),
      );
    }
  }
}
