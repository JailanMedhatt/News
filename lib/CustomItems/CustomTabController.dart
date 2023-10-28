import 'package:flutter/material.dart';
import 'package:news/ApiManager.dart';
import 'package:news/CustomItems/NewsController.dart';
import 'package:news/Models/SourceResponse.dart';
import 'package:news/MyTheme.dart';
import 'package:news/CustomItems/NewsContainer.dart';
import 'package:news/CustomItems/SourceContainer.dart';
import 'package:news/ViewModels/NewsViewModel.dart';
import 'package:provider/provider.dart';

class CustomTabController extends StatefulWidget {
  List<Source> sourcesList;

  CustomTabController({required this.sourcesList});

  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  int selectedIndex=0;

NewsViewModel viewModell=NewsViewModel();
  @override
  Widget build(BuildContext context) {
     return
       ChangeNotifierProvider(
         create: (context)=>viewModell,
         child: DefaultTabController(

            length: widget.sourcesList.length,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {

                      viewModell.ChangeselectedIndex(index,widget.sourcesList[index].id!).then((value){setState(() {

                      });});


                  },
                        isScrollable: true,
                    indicatorColor: Colors.transparent
                    ,tabs: widget.sourcesList.map((source) => SourceContainer(source: source, isSelected: viewModell.selectedIndex== widget.sourcesList.indexOf(source))).toList(),

                ),
                NewsController(sourceId: widget.sourcesList[viewModell.selectedIndex].id!)
                // Consumer<NewsViewModel>(builder: (context, child, viewModel){
                //   if(viewModell.errorMessage!=null){
                //     return Column(children: [
                //       Text(viewModell.errorMessage!),
                //       ElevatedButton(onPressed:(){
                //         viewModell.getNews(widget.sourcesList[selectedIndex]?.id??"");
                //       }, child: Text("Try Again"))
                //     ],);
                //   }
                //   else if(viewModell.newsList==null){
                //     return Center(child:  CircularProgressIndicator(color: MyTheme.primaryGreen),);
                //   }
                //   else{
                //     return Expanded(child: ListView.builder(itemBuilder:(context,index)=>Newscontainer(news: viewModell.newsList![index]) , itemCount: viewModell.newsList?.length,));
                //   }
                // })
                // FutureBuilder(future: ApiManager.getNewsResponse(widget.sourcesList[selectedIndex]?.id??""), builder:(context,snapchot){
                //   if(snapchot.connectionState== ConnectionState.waiting){
                //     return Padding(
                //       padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.33),
                //       child: Center(child: CircularProgressIndicator(
                //         color: MyTheme.primaryGreen,
                //       )),
                //     );
                //   }
                //   else if(snapchot.hasError){
                //     return Column(children: [
                //       Text("Something went wrong"),
                //       ElevatedButton(onPressed: (){}, child: Text("Try again"))
                //
                //     ],);
                //   }
                //   if(snapchot.data?.status!="ok"){
                //     return Column(children: [
                //       Text(snapchot.data?.message??""),
                //       ElevatedButton(onPressed: (){}, child: Text("Try again"))
                //
                //     ],);
                //   }
                //   var newslist = snapchot.data?.articles??[];
                //   return Expanded(child: ListView.builder(itemBuilder:(context,index)=>Newscontainer(news: newslist[index]) , itemCount: newslist.length,));
                // })
              ],
            )),
       );

  }
}
