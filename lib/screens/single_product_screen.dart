import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:karinashop/model/cart.dart';
import 'package:karinashop/model/product.dart';
import 'package:karinashop/shared/constants.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  bool isFavorited = false;
  void toFavorite() {
    setState(() {
      if (!isFavorited) {
        isFavorited = true;
      } else {
        isFavorited = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'KarinaShop',
          style: TextStyle(
              fontFamily: 'Courgette',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                toFavorite();
              },
              icon: isFavorited
                  ? const Icon(Icons.favorite_rounded, color: Colors.blueGrey)
                  : const Icon(Icons.favorite_border_outlined)),
                   IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: const FaIcon(FontAwesomeIcons.cartShopping)),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ImageSection(widget: widget),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  //bottomLeft: Radius.circular(30),
                  //bottomRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: cBlack,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: [
                            RatingBar(
                                initialRating: widget.product.rate,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 25,
                                itemCount: 1,
                                ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star,
                                        color: Colors.orange),
                                    half: const Icon(
                                      Icons.star_half,
                                      color: Colors.blueGrey,
                                    ),
                                    empty: const Icon(
                                      Icons.star_outline,
                                      color: Colors.black,
                                    )),
                                onRatingUpdate: (value) {
                                  setState(() {});
                                }),
                            Text(
                              '(${widget.product.rate})',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.product.description,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Taille :',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        SizeView(widget: widget),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 70),
                        const Text(
                          'Couleur :',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        ColorView(widget: widget),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(widget: widget),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SingleProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        //color: Color.fromARGB(255, 213, 222, 221),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              NumberFormat.currency(locale: 'fr', symbol: 'F')
                  .format(widget.product.price),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                 context.read<CartManager>().addToCart( CartItem(
                        productId: widget.product.id,
                        name: widget.product.title,
                        price: widget.product.price,
                        quantity: 1,
                        imgUrl: widget.product.imageUrl), context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: cWhite, backgroundColor: cBlack,
                minimumSize: const Size(150, 100),
                //padding: const EdgeInsets.all(20),
                elevation: 0.6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              label: const Text(
                'Ajouter',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SizeView extends StatelessWidget {
  const SizeView({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SingleProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(children: [SizeWidget(product: widget.product)]),
        ),
      ),
    );
  }
}

class ColorView extends StatelessWidget {
  const ColorView({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SingleProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(children: [ColorWidget(product: widget.product)]),
        ),
      ),
    );
  }
}

class SizeWidget extends StatelessWidget {
  final Product product;
  const SizeWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        product.size.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            color: cBlack,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
              child: Text(
            product.size[index],
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: cWhite),
          )),
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SingleProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.0),
      child: Image.asset(
        widget.product.imageUrl,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final Product product;
  const ColorWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 25,
          width: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 2),
              color: const Color.fromARGB(255, 11, 140, 196),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
        ),
      ),
    );
  }
}
