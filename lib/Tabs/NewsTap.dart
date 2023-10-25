import 'package:flutter/material.dart';
import 'package:news/ApiManager.dart';
import 'package:news/Models/Category.dart';
import 'package:news/Models/SourceResponse.dart';
import 'package:news/MyTheme.dart';
import 'package:news/CustomItems/CustomTabController.dart';
import 'package:news/ViewModels/SourceViewModel.dart';
import 'package:provider/provider.dart';

class NewsTap extends StatefulWidget {
  Category category;
  NewsTap({required this.category});

  @override
  State<NewsTap> createState() => _NewsTapState();
}

class _NewsTapState extends State<NewsTap> {
  SourceViewModel viewModel = SourceViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(create: (context)=>viewModel,
    child: Consumer<SourceViewModel>(builder: (child, viewModel, context){
      if(viewModel.errorMessage!=null){
        return Column(
          children: [
            Text(viewModel.errorMessage!),
            ElevatedButton(onPressed:(){
              setState(() {

              });
              viewModel.getSources(

                widget.category.id);}, child: Text("Try again"),
            )
          ],
        );


      }
      else if(viewModel.sourceList==null){
        return Center(child: CircularProgressIndicator(
          color:MyTheme.primaryGreen ,
        ),);

      }
      else{
        return CustomTabController(sourcesList: viewModel.sourceList!);
      }
    }),);
    //FutureBuilder<SourceResponse?>(
    //     future: ApiManager.getSourceResponse(category.id),
    //     builder: (context, snapchot){
    //       if(snapchot.connectionState== ConnectionState.waiting){
    //         return Center(child: CircularProgressIndicator(
    //           color: MyTheme.primaryGreen,
    //         ));
    //       }
    //       else if(snapchot.hasError){
    //         return Column(children: [
    //           Text("Something went wrong"),
    //           ElevatedButton(onPressed: (){}, child: Text("Try again"))
    //
    //         ],);
    //       }
    //       if(snapchot.data?.status!="ok"){
    //         return Column(children: [
    //           Text(snapchot.data?.message??""),
    //           ElevatedButton(onPressed: (){}, child: Text("Try again"))
    //
    //         ],);
    //       }
    //       List<Source> sourcesList= snapchot.data?.sources??[];
    //       return CustomTabController(sourcesList: sourcesList);
    //
    //     });
  }
}
