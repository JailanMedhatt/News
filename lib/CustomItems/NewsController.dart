import 'package:flutter/material.dart';
import 'package:news/CustomItems/NewsContainer.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/MyTheme.dart';
import 'package:news/ViewModels/NewsViewModel.dart';
import 'package:provider/provider.dart';

class NewsController extends StatefulWidget {
  String sourceId;
  NewsController({required this.sourceId});
  @override
  State<NewsController> createState() => _NewsControllerState();
}

class _NewsControllerState extends State<NewsController> {
  bool isLoadin= false;
  NewsViewModel viewModell = NewsViewModel();

  String pageNum = "1";
  @override
  void initState() {
    viewModell.getNews(widget.sourceId, pageNum: pageNum).then((value) {
      NewsViewModel.allNews= viewModell.newsList;
    });

    scrollController.addListener(pagination);
    // TODO: implement initState
    super.initState();
  }

  var scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

      create: (context) => viewModell,
      child: Consumer<NewsViewModel>(builder: (context, child, viewModel) {
        if (viewModell.errorMessage != null) {
          return Column(
            children: [
              Text(viewModell.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModell.getNews(widget.sourceId);
                  },
                  child: Text("Try Again"))
            ],
          );
        } else if (NewsViewModel.allNews == null) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.33),
            child: Center(
              child: CircularProgressIndicator(color: MyTheme.primaryGreen),
            ),
          );
        } else {
          return Expanded(
              child: ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) =>
                Newscontainer(news: NewsViewModel.allNews![index]),
            itemCount: NewsViewModel.allNews?.length,
          ));
        }

      }),
    );
  }

  void pagination() {

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      scrollController.position.saveScrollOffset();
      int numOfPages = int.parse(pageNum);
      pageNum = (numOfPages += 1).toString();
      viewModell.getNews(widget.sourceId, pageNum: pageNum).then((value) {
        NewsViewModel.allNews?.addAll(viewModell?.newsList ?? []);
        scrollController.position.restoreScrollOffset();
      });

    }
  }
}
