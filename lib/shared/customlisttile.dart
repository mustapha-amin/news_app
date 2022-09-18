import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/articles_model.dart';

Widget customListTile(Article article) {
  return Container(
    constraints: const BoxConstraints(maxHeight: 400),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    child: Column(
      children: [
        Container(
          height: 200,
          decoration: article.urlToImage != null
              ? BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage!),
                  ),
                )
              : null,
        ),
        addVerticalSpace(10),
        Container(
          child: Text(article.title!),
        )
      ],
    ),
  );
}

Widget addVerticalSpace(double? size) {
  return SizedBox(
    height: size,
  );
}
