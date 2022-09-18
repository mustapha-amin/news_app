import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';

import '../shared/myWidgets.dart';

class NewsDetail extends StatelessWidget {
  Article? article;
  NewsDetail({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(article!.source!.name!),
        foregroundColor: Colors.black,
      ),
      body: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: article!.urlToImage! != null
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(article!.urlToImage!),
                        fit: BoxFit.cover,
                      ),
                    )
                  : const BoxDecoration(color: Colors.grey),
            ),
            addVerticalSpace(10),
            Container(
              child: Text(
                article!.description!,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Text(article!.url!),
          ],
        ),
      ),
    );
  }
}
