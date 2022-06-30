import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String rating;
  final Map<String,int> guide;
  final String description;
  final int charges;
  const DetailsPage({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.rating,
    required this.guide,
    required this.description,
    required this.charges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
