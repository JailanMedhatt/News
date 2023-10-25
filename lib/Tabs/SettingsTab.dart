import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';

class SettingsTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
          Container(  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: MyTheme.primaryGreen, width: 3)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("English", style: TextStyle(color: MyTheme.primaryGreen, fontSize: 20),),
              Icon(Icons.arrow_drop_down, color: MyTheme.primaryGreen,
              size: 30,)
            ],)
          )
        ],
      ),
    );

  }
}
