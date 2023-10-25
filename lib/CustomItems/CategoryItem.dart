import 'package:flutter/material.dart';
import 'package:news/Models/Category.dart';

class CategoryItem extends StatelessWidget {
 int index;
 Category category;
 CategoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(index%2==0?0:20),
          bottomLeft: Radius.circular(index%2!=0?0:20)

        ),
            color: category.bgColor
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(category.imagePath)),
          Text(category.title, style: TextStyle(fontSize: 22, color: Colors.white),)
        ],
      ),
    );
  }
}
