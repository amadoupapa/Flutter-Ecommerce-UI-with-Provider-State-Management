import 'package:flutter/material.dart';


import '../../model/product.dart';
import 'product_card.dart';

class PopularProductView extends StatelessWidget {
  const PopularProductView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          samples_popular_product.length,
          (index) => ProductCard(product: samples_popular_product[index]),
        ),
      ),
    );
  }
}
