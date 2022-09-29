import 'package:flutter/material.dart';
import '../../../models/category_movie.dart';


class CategoryItem extends StatelessWidget {

  Genres genre ;

  CategoryItem({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/categoryImage.png',),
        Positioned(
          top: 30,
          left: 50,
          child: Text(genre.name ?? '',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
        ),
      ],
    );
  }
}