// import 'package:flutter/material.dart';
// import 'package:karinashop/model/cart.dart';

// class CartManager with ChangeNotifier {
//   double totalPrice = 0;
//   double get getTotalPrice => totalPrice;
//   List<Cart> currentCart = samples_cart;

//   addItem(index) {
//     //incremente de 1 la qte du produit en question
//     currentCart[index].product.numOfItems++;
//     updateTotalPrice();
//     notifyListeners();
//   }

//   removeItem(index) {
//     //decremente de 1 la qte du produit en question
//     if (currentCart[index].product.numOfItems > 0) {
//       currentCart[index].product.numOfItems--;
//       notifyListeners();
//       updateTotalPrice();
//     } else {
//       currentCart[index].product.numOfItems = 0;
//       notifyListeners();
//       updateTotalPrice();
//     }
//   }

//   double getSubTotal(index) {
//     //retourne le sous total de chaque produit du panier
//     double subTotal = 0;
//     currentCart[index].product.price * currentCart[index].product.numOfItems;
//     notifyListeners();
//     return subTotal;
//   }

//   void updateTotalPrice() {
//     //actualise le prix total des produit du panier
//     totalPrice = 0;
//     for (var element in currentCart) {
//       totalPrice += element.product.price * element.product.numOfItems;
//       notifyListeners();
//     }
//   }

//   void removeFromCart(index) {
//     currentCart.removeAt(index);
//     updateTotalPrice();
//     notifyListeners();
//   }

//   void wipeCart() {
//     currentCart.clear();
//     updateTotalPrice();
//     notifyListeners();
//   }
// }
