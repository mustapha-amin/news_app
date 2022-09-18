import 'package:flutter/material.dart';
import 'package:news_app/screens/news_detail.dart';
import '/models/articles_model.dart';

Widget customListTile(BuildContext context, Article article) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NewsDetail(
          article: article,
        );
      }));
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      constraints: const BoxConstraints(maxHeight: 260),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
            ),
          ]),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 169,
            decoration: article.urlToImage != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(article.urlToImage!),
                      fit: BoxFit.cover,
                    ),
                  )
                : BoxDecoration(color: Colors.grey),
          ),
          addVerticalSpace(10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(article.source!.name!),
                ),
                Text(article.title!),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget addVerticalSpace(double? size) {
  return SizedBox(
    height: size,
  );
}
