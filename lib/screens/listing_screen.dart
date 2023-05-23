import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karinashop/model/product.dart';
import '../components/product_card.dart';
import 'cart_screen.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({Key? key, required this.sampleProduct, required this.title})
      : super(key: key);
  final List<Product> sampleProduct;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset("assets/icons/menu.svg")),
        title: const Text(
          'KarinaShop',
          style: TextStyle(
              fontFamily: 'Courgette',
              fontWeight: FontWeight.bold,
              fontSize: 27),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
               IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: const FaIcon(FontAwesomeIcons.cartShopping)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
            Center(child: Text(title,style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),)),
        SizedBox(
          height: size.height * 0.8,
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
            itemCount: sampleProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(product: sampleProduct[index]);
            },
          ),
        ),
      ])),
    );
  }
}
