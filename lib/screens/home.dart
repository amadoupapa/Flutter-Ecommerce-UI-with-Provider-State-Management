import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karinashop/model/product.dart';
import 'package:karinashop/screens/listing_screen.dart';
import 'package:karinashop/shared/constants.dart';

import '../components/categories_view.dart';
import '../components/news_product_view.dart';
import '../components/popular_product_view.dart';
import 'cart_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          //TODO TO BE IMPLEMENTED
            onPressed: () {}, icon: SvgPicture.asset("assets/icons/menu.svg")),
        title: const Text(
          'KarinaShop',
          style: TextStyle(
              fontFamily: 'Courgette',
              fontWeight: FontWeight.bold,
              fontSize: 27)
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 30)),
           IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: const FaIcon(FontAwesomeIcons.cartShopping)),
        ],
      ),
      body: SingleChildScrollView(
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),
            const CategoriesView(),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Populaires',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: cBlack),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => ProductListingScreen(
                            title: 'Populaires',
                            sampleProduct: samples_popular_product,
                          )),
                    )),
                    child: Text(
                      'tout voir...',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: cBlack),
                    ),
                  ),
                ],
              ),
            ),
            const PopularProductView(),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nouveautés',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: cBlack),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => ProductListingScreen(
                            title: 'Nouveautés',
                            sampleProduct: samples_news_product,
                          )),
                    )),
                    child: Text(
                      'tout voir...',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: cBlack),
                    ),
                  ),
                ],
              ),
            ),
            const NewsProductViews()
          ],
        )),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Explorer',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
