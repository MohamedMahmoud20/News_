
import 'package:flutter/material.dart';
import 'package:shop_app/Screens/Web_View.dart';

String baseUrl = "https://newsapi.org/v2/top-headlines?";
String key = "&apiKey=50636db3bbf44b8384e182d36cd6d0d2";

Widget articleBuild({@required article  ,@required context}) {
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
        return Web_View(url: article["url"],);
      }));
    },
    child: Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                (article['urlToImage'] == null)
                    ? "https://bitsofco.de/content/images/2018/12/broken-1.png"
                    : "${article['urlToImage']}",
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${article['title']}",
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                (article['description'] == null)
                    ? "No Description"
                    : "${article['description']}",
                style:
                    Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget mySizeBox(){
  return SizedBox(height: 10);
}