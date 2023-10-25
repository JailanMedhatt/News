import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/newsFullWidget.dart';

class Newscontainer extends StatelessWidget {

  News news;

  Newscontainer({required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime date= DateTime.parse(news.publishedAt??"");
    return Container(
      padding: EdgeInsets.all(8),

      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, NewsFullWidget.routeName, arguments: this.news);
        },
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(news.urlToImage??""),
            ),
            SizedBox( height: 5),
            Text(news.author??"", style: TextStyle(fontSize: 12, color: Colors.blueGrey),),
            SizedBox( height: 4),
            Text(news.title??"", style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            SizedBox( height: 3),
            Text("${date.day}/${date.month}/${date.year}", textAlign: TextAlign.end,style: TextStyle(fontSize: 14, color: Colors.blueGrey),)


          ],
        ),
      ),
    );
  }
}
