import 'package:get/get.dart';
 import 'package:getx_shop_card/feature/favorute/view_model/state.dart';

import '../../home/model/product_model.dart';

class FavouriteViewModel extends GetxController {
  static FavouriteViewModel get controller => Get.find<FavouriteViewModel>();

  @override
  void onInit() {
    state.favList;

    super.onInit();
  }

  FavouriteState state = FavouriteState();

  bool itemIsExist(ProductModel item) => state.favList.where((element) {
         return element.id == item.id;
      }).isNotEmpty;

    toggleFavourite(ProductModel item) {
     item.isFavorite = itemIsExist(item);
    if (!itemIsExist(item)) {
      state.favList.add(item);
    } else if (itemIsExist(item)) {
      state.favList.removeAt(state.favList.indexOf(
          state.favList.firstWhere((element) => element.id == item.id)));
    }
     update();
  }
}
