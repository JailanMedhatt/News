import 'package:flutter/material.dart';
import 'package:news/CustomItems/CategoryItem.dart';
import 'package:news/Models/Category.dart';

class CategoriesTab extends StatelessWidget {
  Function onCategoryClicked;
  CategoriesTab({required this.onCategoryClicked});
  @override
  Widget build(BuildContext context) {
    List<Category> categoriesInfoList = Category.getCategoryListInfo();
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your category \n of interest",
            style: TextStyle(
                color: Color(0xff4F5A69),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: categoriesInfoList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  onCategoryClicked(categoriesInfoList[index]);
                },
                child: CategoryItem(
                    category: categoriesInfoList[index], index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
