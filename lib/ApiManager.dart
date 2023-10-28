import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Models/NewsResponse.dart';
import 'package:news/Models/SourceResponse.dart';

class ApiManager {
  //29cc8bd086a54ce8b81ad3e135189f23
   static Future<SourceResponse?>getSourceResponse(String categoryId) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=2cfef70d06bf492c9f74fa6793958143
     //0bbcdc126e884b58a3dd221669aa6302
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "0bbcdc126e884b58a3dd221669aa6302",
        "category":categoryId});
    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      return SourceResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }


  }
  static Future<NewsResponse?> getNewsResponse(String sId,String pageNum)async{
     //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2cfef70d06bf492c9f74fa6793958143
    Uri url = Uri.https("newsapi.org","/v2/everything",{"apiKey":"0bbcdc126e884b58a3dd221669aa6302"
       , "sources": sId,
    "page":pageNum,
    "pageSize":"3"},
    );
    try{
      var response= await http.get(url);
      var bodyString = response.body;
      var json= jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }
        catch(e){
      throw e;
        }
  }
   static Future<NewsResponse?> SearchNews(String query)async{
     //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2cfef70d06bf492c9f74fa6793958143
     Uri url = Uri.https("newsapi.org","/v2/everything",{"apiKey":"0bbcdc126e884b58a3dd221669aa6302"
       ,
     "q":query},
     );
     try{
       var response= await http.get(url);
       var bodyString = response.body;
       var json= jsonDecode(bodyString);
       return NewsResponse.fromJson(json);
     }
     catch(e){
       throw e;
     }
   }
}
