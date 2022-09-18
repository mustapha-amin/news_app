import 'package:flutter/material.dart';
import '/models/articles_model.dart';

Widget customListTile(Article article) {
  return Container(
    constraints: const BoxConstraints(maxHeight: 260),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
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
  );
}

Widget addVerticalSpace(double? size) {
  return SizedBox(
    height: size,
  );
}
