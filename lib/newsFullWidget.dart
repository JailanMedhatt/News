import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/MyTheme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFullWidget extends StatefulWidget {
 static String routeName="newsFull";

  @override
  State<NewsFullWidget> createState() => _NewsFullWidgetState();
}

class _NewsFullWidgetState extends State<NewsFullWidget> {
 // late final Uri _url ;

  @override
  Widget build(BuildContext context) {


    var newsArg= ModalRoute.of(context)?.settings.arguments as News;
    DateTime date= DateTime.parse(newsArg.publishedAt??"");
    // _url = Uri.parse(newsArg?.url??"");
    return Scaffold(
      appBar: AppBar(
        title:  Text("News", style: TextStyle(fontSize: 22),),

      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(newsArg?.urlToImage??""),
            ), SizedBox( height: 12),
            Text(newsArg.author??"", style: TextStyle(fontSize: 12, color: Colors.blueGrey),),
            SizedBox( height: 6),
            Text(newsArg.description??"", style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            SizedBox( height: 5),
            Text("${date.day}/${date.month}/${date.year}", textAlign: TextAlign.end,style: TextStyle(fontSize: 14, color: Colors.blueGrey),)
           , Container(margin:EdgeInsets.symmetric(horizontal: 15,vertical:30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('''${newsArg?.content.toString()??""}''', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                      TextButton(onPressed:()async{
                        showDialog(context: context, builder:(context)=>AlertDialog(
                          content: Row(children: [CircularProgressIndicator(color: MyTheme.primaryGreen,), SizedBox(width: 5,), Text("Loading..")],),
                        ));
                        final url= Uri.parse(newsArg.url??"",);
                        try{

                        if(await canLaunchUrl(url, )){
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                          print(url.toString());}


                        }


                        catch(e){

                        }
                        Navigator.pop(context);
                      }, child: Row( mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("View full Article",style: TextStyle(color: MyTheme.primaryGreen),),
                        Icon(Icons.play_arrow,color: MyTheme.primaryGreen)],)) ],
                  )),

          ],),
        ),
      ),
    );}


}
