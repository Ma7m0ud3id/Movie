import 'package:flutter/material.dart';
import '../../../../shared/network/api_manager.dart';
import '../../../models/similler_response.dart';
import '../../home/Item/feach_top_rated_item.dart';



class MoviesDetailsItem extends StatelessWidget {
 int id;
 MoviesDetailsItem(this.id);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xff282A28),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            ' More Like This',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Expanded(
            child: FutureBuilder<SimillarResponse>(
                future: ApiManager.getMoviesSimilar(id),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snap.hasError) {
                    return const AlertDialog(
                      content: Text("Error"),
                    );
                  }
                  var listOfSimilar = snap.data!.results ?? [];
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfSimilar.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //todo : navigator to details
                          },
                          child: FeachTopRatedItem(
                          results: listOfSimilar[index],),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}