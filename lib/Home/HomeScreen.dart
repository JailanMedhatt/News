import 'package:news/Home/HomeDrawer.dart';
import 'package:news/Models/Category.dart';
import 'package:flutter/material.dart';
import 'package:news/NewsSearchDelegate.dart';
import 'package:news/Tabs/CategoriesTap.dart';

import 'package:news/Tabs/NewsTap.dart';
import 'package:news/Tabs/SettingsTab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "homeSc";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem==1?"Settings":selectedCategory==null?"NewsApp": selectedCategory!.title!, style: TextStyle(fontSize: 25),),
        actions: [IconButton(onPressed:(){showSearch(context: context, delegate: NewsSearchDelegate());}, icon: Icon(Icons.search_sharp, size: 30,))],
      ), drawer: Drawer(
      child: HomeDrawer(onClicked: onItemMenuClicked,),

    ),
      body:selectedItem==1?SettingsTab(): selectedCategory==null?CategoriesTab(onCategoryClicked: onCategoryClicked):NewsTap(
        category: selectedCategory!,
      ),
    );
  }

  Category? selectedCategory= null;
  int selectedItem=2;

  void onCategoryClicked(Category category){
    selectedCategory = category;
    setState(() {

    });

  }
  void onItemMenuClicked(int index){
    selectedItem=index;
    setState(() {
      selectedCategory=null;
    });
    Navigator.pop(context);
  }
}
