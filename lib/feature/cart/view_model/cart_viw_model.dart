import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/color.dart';
import '../../home/model/product_model.dart';
import '../model/cart_model.dart';
import 'cart_stats.dart';

class CartViewModel extends GetxController {
  static CartViewModel get controller => Get.find<CartViewModel>();

  CartState state = CartState();

  ///===============-------------------  There We Add Product to Card ------------================
  addProduct(ProductModel item) {
    ///===============------------------- Check If product is Exist in Cart ------------================
    bool itemIsExist = (state.cartList).where((element) {
      return element.id == item.id;
    }).isNotEmpty;

    ///===============-------------------  if Item Exist it add 1 to old Quantity and show Snack bar ------------================
    if (itemIsExist) {
      int index = state.cartList.indexOf(state.cartList.firstWhere((element) {
        return element.id == item.id;
      }));

      ///===============-------------------  Check the available  quantity of the product is less then rquired product ------------================

      addToQuantity(index);
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Quantity is Update",
        "${state.cartList[index].quantity} pieces",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        backgroundColor: AppColors.greenColor,
      );
    } else {
      state.cartList.add(CartModel.fromJson(item.toJson()));
      Get.snackbar(
        "Success",
        "Success Add product to Cart",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        backgroundColor: AppColors.greenColor,
      );
    }
    update();
  }
  removeProduct(index) {
    state.cartList.removeAt(index);

    update();
  }

  addToQuantity(index) {
    if (state.cartList[index].quantity <
        state.cartList[index].remainingQuantity) {
      state.cartList[index].quantity += 1;
    } else {
      Get.closeCurrentSnackbar();
      Get.snackbar(
        "Sorry",
        "you can't add more for this Item",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        backgroundColor: AppColors.mediumRed,
      );
    }

     update();
  }


  clearCart(){
    state.cartList.clear();
    update();
  }

  double get totalCost {
    double cost = 0;
    for (CartModel item in state.cartList) {
      cost += (state.cartList[state.cartList.indexOf(item)].productPrice*
          state.cartList[state.cartList.indexOf(item)].quantity);
    }
    return cost;
  }

  removeFromQuantity(index) {
    if (state.cartList[index].quantity <= 1) {
      state.cartList[index].quantity = 1;
    } else {
      state.cartList[index].quantity -= 1;
    }
    update();
  }

  deleteProduct(int index) {
    state.cartList.removeAt(index);
    update();
  }
}
