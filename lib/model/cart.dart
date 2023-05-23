import 'package:flutter/material.dart';

import '../shared/constants.dart';


class Cart {
  List<CartItem> items = [];
}

class CartItem {
  String productId;
  String name;
  int quantity;
  double price;
  String imgUrl;
  bool added = false;

  CartItem(
      {required this.productId,
      required this.name,
      required this.quantity,
      required this.price,
      required this.imgUrl});
}

class CartManager with ChangeNotifier {
  double totalPrice = 0;
  double get getTotalPrice => totalPrice;
  final Cart cart = Cart();

  void addToCart(CartItem cartItem, BuildContext context) {
    bool isAdded = cart.items.any((x) => x.productId == cartItem.productId);
    if (!isAdded) {
      cart.items.add(cartItem);
      cartItem.added = true;
      updateTotalPrice();
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: const Text('Produit ajouté au panier'),backgroundColor: ftColor));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: const Text('Le produit est déjà dans le panier'),backgroundColor: ftColor));
    }
  }

 
  void updateTotalPrice() {
    totalPrice = 0;
    for (var item in cart.items) {
      totalPrice += item.price * item.quantity;
      notifyListeners();
    }
  }

  void increaseQty(itemIndex) {
    cart.items[itemIndex].quantity++;
    notifyListeners();
    updateTotalPrice();
  }

  void decreaseQty(itemIndex) {
    if (cart.items[itemIndex].quantity > 0) {
      cart.items[itemIndex].quantity--;
      notifyListeners();
      updateTotalPrice();
    } else {
      cart.items[itemIndex].quantity = 0;
      notifyListeners();
      updateTotalPrice();
    }
  }

  void wipeCart() {
    cart.items.clear();
    notifyListeners();
    updateTotalPrice();
  }

  void removeFromCart(index) {
    cart.items.removeAt(index);
    notifyListeners();
    updateTotalPrice();
  }
  //TODO TO BE IMPLEMENTED
  void setOrder({required BuildContext context, required String fName, required String lname, required String email, required String phoneNumb, required String address1}) {}
}


