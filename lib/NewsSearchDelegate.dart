import 'package:flutter/material.dart';
import 'package:news/ApiManager.dart';
import 'package:news/CustomItems/NewsContainer.dart';
import 'package:news/MyTheme.dart';

class NewsSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed:(){
     showResults(context);
   }, icon: Icon(Icons.search_rounded))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed:(){
      Navigator.pop(context);
    }, icon: Icon(Icons.close_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text("Suggestions"));
    }
    return
    FutureBuilder(future: ApiManager.SearchNews(query), builder:(context,snapchot){
      if(snapchot.connectionState== ConnectionState.waiting){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.33),
          child: Center(child: CircularProgressIndicator(
            color: MyTheme.primaryGreen,
          )),
        );
      }
      else if(snapchot.hasError){
        return Column(children: [
          Text("Something went wrong"),
          ElevatedButton(onPressed: (){}, child: Text("Try again"))

        ],);
      }
      if(snapchot.data?.status!="ok"){
        return Column(children: [
          Text(snapchot.data?.message??""),
          ElevatedButton(onPressed: (){}, child: Text("Try again"))

        ],);
      }
      var newslist = snapchot.data?.articles??[];
      return ListView.builder(itemBuilder:(context,index)=>Newscontainer(news: newslist[index]) , itemCount: newslist.length,);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
  @override
  ThemeData appBarTheme(BuildContext context) {
   return ThemeData(
       appBarTheme: AppBarTheme(
           color: MyTheme.primaryGreen,
           centerTitle: true,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(30),
                   bottomRight: Radius.circular(30)
               )
           )
       ),
     inputDecorationTheme: InputDecorationTheme(
       enabledBorder: OutlineInputBorder(
         borderSide: BorderSide.none
       ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none
     )
     ));

  }

}