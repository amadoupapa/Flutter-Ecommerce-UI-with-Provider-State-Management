import 'package:flutter/material.dart';
import 'package:karinashop/model/category.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          sample_category.length,
          (index) =>
              CategoryChip(title: sample_category[index].title, press: () {}),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({Key? key, required this.title, required this.press})
      : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {},
          child: Chip(
            label: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            avatar: null,
            backgroundColor: Colors.white70,
          )),
    );
  }
}
