import 'package:flutter/material.dart';

import '../../../models/Latest_movie.dart';
import '../../../shared/network/api_manager.dart';
import '../Item/feach_lates_movies_item.dart';

class FechLatestApi extends StatefulWidget {
  @override
  State<FechLatestApi> createState() => _FechLatestApiState();
}

class _FechLatestApiState extends State<FechLatestApi> {
  bool add=false;

  @override
  Widget build(BuildContext context) {
     Image play = Image.asset('assets/images/play.png');
    return FutureBuilder<LatestMovie>(
        future: ApiManager.getMovieslatest(),
        builder:(context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snap.hasError){
           
            return const  AlertDialog(content: Text('Error'),);
          }
          var listOfLatest=snap.data ;
          return InkWell(
            onTap: (){
              // todo : navigator to details
            },
            child: FeachLatesMoviesItem(latestMovie: listOfLatest,play: play),
          );
        });
  }


  
}
