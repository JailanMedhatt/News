import 'package:flutter/material.dart';
import 'package:news/ApiManager.dart';
import 'package:news/Models/SourceResponse.dart';

class SourceViewModel extends ChangeNotifier{
  List<Source>? sourceList;
  String? errorMessage='';
  void getSources( String categoryId) async{
    sourceList=null;
    errorMessage=null;
    notifyListeners();
    try{
    var response = await ApiManager.getSourceResponse(categoryId);
    if(response?.status=="error"){
      errorMessage= response?.message;
    }
    else{
      sourceList= response?.sources;

    }
  }
  catch(e){
      errorMessage= "error loading the source list";

  }
  notifyListeners();
  }

}