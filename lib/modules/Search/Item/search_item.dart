import 'package:flutter/material.dart';
import 'package:movies_app/models/TopRatedRespons.dart';

import '../../../shared/components/constant.dart';
import '../../details/screen/movies_details.dart';

class SearchItem extends StatelessWidget {
  Results results ;
  Image playImage;
  SearchItem({required this.results, required this.playImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              // click watch Film
              Navigator.of(context)
               .pushNamed(MoviesDetails.routeName,
               arguments: results);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageBaseURL +
                        ((results.backdropPath) ??
                            '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                    height: 80,
                    width: 120,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        results.title ?? 'film',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        results.releaseDate ?? 'film',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8,),
                      Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amberAccent,size: 12,),
                              const SizedBox(width: 6,),
                              Text('${results.voteAverage}' ,
                                   style:const  TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.normal)),
                            ],
                          )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    // click watch Film
                  },
                  child: playImage)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(height: 8,color:Colors.grey ,) 
        ],
      ),
    );
  }
}