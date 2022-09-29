import 'package:flutter/material.dart';
import 'package:movies_app/modules/home/screen/feach_top_rated.dart';
import 'package:movies_app/modules/home/screen/fech_lates_movies.dart';
import 'package:movies_app/modules/home/screen/fetch_popular_data.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // top Movies
        Expanded(
          flex:8,
          child: FechLatestApi()),
         
          // Relleases movies
        Expanded(
          flex:5,
          child: FechPopularApi()),
        const SizedBox(height: 20,),
        const Expanded(
          flex:8,
          child: FeachTopRated()),
      ],
    );
  }
}
