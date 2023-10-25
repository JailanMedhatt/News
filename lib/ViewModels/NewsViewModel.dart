import 'package:flutter/material.dart';
import 'package:news/ApiManager.dart';
import 'package:news/Models/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
  String? errorMessage;
  List<News>? newsList;
  String pageNum="1";
  static List<News>? allNews;
  int selectedIndex=0;


  Future<void> ChangeselectedIndex(int index, String sId) async {
   try {
     allNews=null;
     notifyListeners();
     await getNews(sId);
     allNews=newsList;
     selectedIndex = index;

     notifyListeners();

     print("index changed");


   }
  catch(e){
     print("something went erong");
  }}
  Future <void> getNews(String sId, {String pageNum = "1"})async{
    errorMessage=null;
    newsList=null;
    //newsList=null;

    notifyListeners();
    try{
      var response = await ApiManager.getNewsResponse(sId,pageNum);
      if(response?.status=="error"){
        errorMessage = response?.message;
      }
      else{
     newsList=response?.articles;


        }
  }
  catch(e){
      errorMessage='error loading news';
  }
    notifyListeners();
  }


}