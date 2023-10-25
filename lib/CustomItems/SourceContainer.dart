import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';
import 'package:news/Models/SourceResponse.dart';

class SourceContainer extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceContainer({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected?MyTheme.primaryGreen: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: MyTheme.primaryGreen,width: 3)
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Text(source.name??"", style: TextStyle(
        color: isSelected?Colors.white:MyTheme.primaryGreen,
        fontSize: 19
      ),),
    );
  }
}
