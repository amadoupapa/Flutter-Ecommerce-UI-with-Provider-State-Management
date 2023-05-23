import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Product {
  String id;
  String title;
  String imageUrl;
  double price;
  double rate;
  String saves;
  String description;
  List<String> size;
  int numOfItems = 1;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rate,
    required this.saves,
    required this.description,
    required this.size,
  });
}

List<Product> samples_popular_product = [
  Product(
      id: uuid.v4(),
      title: 'Sac Louis Vuitton',
      imageUrl: 'assets/images/8.png',
      price: 25000000,
      rate: 4,
      saves: 'Promo',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M', 'L', 'XL', 'XXL', '1', '2', '3', '4']),
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/1.png',
      price: 30000,
      rate: 4,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      saves: 'Promo'),
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/2.png',
      price: 12500,
      rate: 4,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      saves: 'Promo'),
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/4.png',
      price: 12500,
      rate: 4.5,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      saves: '-20%'),
];

List<Product> samples_news_product = [
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/7.png',
      price: 250000,
      rate: 4,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      saves: 'Promo'),
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/6.png',
      price: 30000,
      rate: 4,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      saves: 'Promo'),
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/5.png',
      price: 12500,
      rate: 4,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      saves: 'Promo'),
  Product(
      id: uuid.v4(),
      title: 'Test',
      imageUrl: 'assets/images/3.png',
      price: 12500,
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia',
      size: ['M'],
      rate: 4.5,
      saves: '-20%'),
];
