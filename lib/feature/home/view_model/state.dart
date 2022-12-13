import 'package:flutter/cupertino.dart';

import '../../../core/util.dart';
import '../../cart/card_page.dart';
import '../../favorute/fav_page.dart';
import '../grosare_screen.dart';
import '../model/address_model.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

class HomeState {
  ScreenStatus categoryState = ScreenStatus.init;
  ScreenStatus addressState = ScreenStatus.init;
  ScreenStatus productStatus = ScreenStatus.init;



  List<ProductModel> productItem=[];
  List<CategoryModel> categoryItem=[];
  List<AddressModel> addressItem=[];
  int selectIndex = 0;
  List screen = [
    const GroScreen(),
    Container(),
    const CardPage(),
    const FavouriteScreen(),
    const CardPage(),
  ];
}
