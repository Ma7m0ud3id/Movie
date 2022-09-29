import 'package:flutter/material.dart';
import '../../../models/TopRatedRespons.dart';
import '../../../shared/network/api_manager.dart';
import '../Item/feach_top_rated_item.dart';

class FeachTopRated extends StatelessWidget {
  const FeachTopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: const Color(0xff282A28),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            ' Recomended',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Expanded(
            child: FutureBuilder<TopRatedRespons>(
                future: ApiManager.getMoviesTopRated(),
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
                  var listOfTopRated = snap.data!.results ?? [];
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfTopRated.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //todo : navigator to details
                          },
                          child: FeachTopRatedItem(
                              results: listOfTopRated[index],),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
