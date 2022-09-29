import 'package:flutter/material.dart';
import '../../../models/movies_respose.dart';
import '../../../shared/network/api_manager.dart';
import '../Item/popular_data_Item.dart';

class FechPopularApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    color: const Color(0xff282A28),
    padding: EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ' New Relleases',
          style: TextStyle(
              fontSize: 16, 
              fontWeight: 
              FontWeight.w500, 
              color: Colors.white),
        ),
       Expanded(
        child: FutureBuilder<MoviesResponse>(
            future: ApiManager.getMoviesPopular(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return  const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snap.hasError) {
                // print(snap.error);
                return const AlertDialog(
                  content: Text("there are some errors"),
                );
              }
              var listOfPopular = snap.data?.results ?? [];
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfPopular.length,
                  itemBuilder: (context, index) {
                  return PopularDataItem(results: listOfPopular[index],);
                  });
            }),
      ),
    ],
    ),
      );
  }
}
