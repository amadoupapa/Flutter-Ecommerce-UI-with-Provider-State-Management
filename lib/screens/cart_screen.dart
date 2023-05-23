import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../shared/constants.dart';
import 'home.dart';
import 'order_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartKey = GlobalKey<_CartScreenState>();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CartManager>().updateTotalPrice();
      //print(context.read<CartManager>().totalPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: null,
        toolbarHeight: size.height * 0.10,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Mon panier',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CartManager>().wipeCart();
              },
              icon: const Icon(Icons.delete_outline_outlined)),
              
        ],
      ),
      body: context.read<CartManager>().cart.items.isNotEmpty
          ? Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(223, 227, 238, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    context.read<CartManager>().cart.items.length,
                    (index) => Dismissible(
                      key: Key(context
                          .read<CartManager>()
                          .cart
                          .items[index]
                          .productId
                          .toString()),
                      background: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrange.shade200,
                        ),
                        child: const Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.delete_forever,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        context.read<CartManager>().removeFromCart(index);
                      },
                      child: Container(
                        height: 110,
                        width: size.width,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(children: [
                          productImageTile(context
                              .watch<CartManager>()
                              .cart
                              .items[index]
                              .imgUrl),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 50,
                                child: productTitleTile((context
                                    .read<CartManager>()
                                    .cart
                                    .items[index]
                                    .name)),
                              ),
                              productPriceTile(
                                double.parse((context
                                    .read<CartManager>()
                                    .cart
                                    .items[index]
                                    .price
                                    .toString())),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.2),
                          productQuantityTile(
                            context
                                .watch<CartManager>()
                                .cart
                                .items[index]
                                .quantity,
                            () {
                              context.read<CartManager>().increaseQty(index);
                            },
                            () {
                              context.read<CartManager>().decreaseQty(index);
                            },
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/empty-cart.svg',
                    width: 120,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Oups votre panier vide ! Veuillez parcourcir notre catalogue pour plus d\'exclusivite !',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage())),style: ElevatedButton.styleFrom(
                        backgroundColor: cBlack,elevation: 0, shape:  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Explorez',
                          style: TextStyle(fontSize: 20,),
                        ),
                      ),)
                ],
              ),
            ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

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
              NumberFormat.currency(locale: 'fr', symbol: 'F').format(
                context.watch<CartManager>().totalPrice,
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const OrderScreen())));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff25D366),
                foregroundColor: Colors.black,
                minimumSize: const Size(150, 100),
                //padding: const EdgeInsets.all(20),
                elevation: 0.6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              icon: const Icon(Icons.phone),
              label: const Text(
                'Commander',
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

Container productImageTile(String imgUrl) {
  //imgUrl.replaceAll("https://127.0.0.1/", "https://10.151.16.197/");
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Image.asset(
      imgUrl,
      errorBuilder: (context, error, stackTrace) =>
          (Image.asset('assets/images/noimage.png', scale: 2)),
    ),
  );
}

Text productPriceTile(double price) {
  return Text(NumberFormat.currency(locale: 'fr', symbol: 'F').format(price),
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          overflow: TextOverflow.ellipsis,
          color: ftColor));
}

Text productTitleTile(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ftColor),
  );
}

productQuantityTile(
    int numOfItems, VoidCallback addPress, VoidCallback remPress) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        myIconBtn(Icons.add, addPress, ftColor),
        Text(
          '$numOfItems',
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 20, color: ftColor),
        ),
        myIconBtn(Icons.remove, remPress, Colors.orange.shade500),
      ],
    ),
  );
}

CircleAvatar myIconBtn(IconData icon, VoidCallback press1, Color color) {
  return CircleAvatar(
      backgroundColor: color,
      radius: 13,
      child: IconButton(
          padding: const EdgeInsets.all(0),
          icon: Icon(
            icon,
            size: 22,
            color: Colors.white,
          ),
          onPressed: press1));
}
