import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:karinashop/model/product.dart';
import 'package:intl/intl.dart';
import 'package:karinashop/screens/single_product_screen.dart';

import '../../shared/constants.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
    return Container(
      height: 280,
      width: 190,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  padding: const EdgeInsets.all(-4.0),
                  label: Text(
                    widget.product.saves,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  avatar: null,
                  backgroundColor: const Color.fromARGB(179, 237, 160, 160),
                ),
                IconButton(
                    onPressed: () {
                      toFavorite();
                    },
                    icon: isFavorited
                        ? Icon(Icons.favorite_rounded, color: cGrey)
                        : const Icon(Icons.favorite_border_outlined)),
              ],
            )),
        //****************************************************************//

        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) =>
                SingleProductScreen(product: widget.product)),
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          widget.product.imageUrl,
                          height: 150,
                          errorBuilder: (context, error, stackTrace) => Text(error.toString()),
                          //width: double.infinity,
                        ),
                      ),
                    ),
                    //****************************************************************//

                    Text(
                      widget.product.title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: ftColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    //****************************************************************//

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          NumberFormat.currency(locale: 'fr', symbol: 'F')
                              .format(widget.product.price),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    //****************************************************************//
                    RatingBar(
                        initialRating: widget.product.rate,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 22,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: cBlack),
                            half: Icon(
                              Icons.star_half,
                              color: cBlack,
                            ),
                            empty: const Icon(
                              Icons.star_outline,
                              color: Colors.black,
                            )),
                        onRatingUpdate: (value) {
                          setState(() {});
                        }),
                  ],
                )),
          ),
        ),
      ]),
    );
  }
}
