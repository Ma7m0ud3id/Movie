import 'package:flutter/material.dart';
import '../../../models/TopRatedRespons.dart';
import '../../../shared/components/constant.dart';
import '../../details/screen/movies_details.dart';

class FeachTopRatedItem extends StatelessWidget {
  Results results;

  FeachTopRatedItem({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){Navigator.of(context)
          .pushNamed(MoviesDetails.routeName,
          arguments: results);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff343534),
            ),
            margin: EdgeInsets.all(4),
            width: 100,
            height: size.height *0.3,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    imageBaseURL +
                        ((results.backdropPath) ??
                            '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                    height: 120,
                    width: 80,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFBB3B),
                        size: 10,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${results.voteAverage}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
                Text(
                  results.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  results.releaseDate ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
          Positioned(
            right: 70,
            top: 0,
            left: 0,
            bottom: 190,
            child: GestureDetector(
                onTap: () {
                  // add to Watchlist
                },
                child: Stack(
                  alignment: Alignment.topCenter, 
                  children: [
                  Image.asset(
                    "assets/images/addToList.png",
                    width: 35,
                    height: 50,
                  ),
                  // firebase Condition
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
