import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';

class HomeDrawer extends StatelessWidget {
  int category=0;
  int settings=1;
 Function onClicked;
 HomeDrawer({required this.onClicked});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 67, bottom: 40),
          color: MyTheme.primaryGreen,
          child: Text("NewsApp", style: TextStyle(fontSize: 25, color:  Colors.white),textAlign: TextAlign.center,),
          
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onClicked(category);
            },
            child: Row(

              children: [
              Icon(Icons.list, size: 40,),
                SizedBox(width: 25,),
                Text("Categories", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
            ],),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onClicked(settings);
            },
            child: Row(

              children: [
                Icon(Icons.settings, size: 40,),
                SizedBox(width: 25,),
                Text("Settings", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
              ],),
          ),
        )
      ],
    );
  }
}
