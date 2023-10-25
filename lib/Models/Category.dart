import 'package:flutter/material.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color bgColor;
  Category(
      {required this.title,
      required this.id,
      required this.imagePath,
      required this.bgColor});
  static List<Category> getCategoryListInfo() {
    return [
      //business entertainment general health science sports technology
      Category(
          title: "Sports",
          id: "sports",
          imagePath: "assets/images/ball.png",
          bgColor: Color(0xffC91C22)),
      Category(
          title: 'General',
          id: "general",
          imagePath: "assets/images/Politics.png",
          bgColor: Color(0xff003E90)),
      Category(
          title: 'Health',
          id: "health",
          imagePath: "assets/images/health.png",
          bgColor:Color(0xffED1E79)),
      Category(
          title: 'Bussiness',
          id: "business",
          imagePath: "assets/images/bussines.png",
          bgColor: Color(0xffCF7E48)),
      Category(
          title: 'Technology',
          id: "technology",
          imagePath: "assets/images/environment.png",
          bgColor: Color(0xff4882CF)),
      Category(
          title: 'Science',
          id: "science",
          imagePath: "assets/images/science.png",
          bgColor: Color(0xffF2D352))
    ];
  }
}
