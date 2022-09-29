import 'package:flutter/material.dart';
import 'package:movies_app/shared/components/add_firebase.dart';
import '../../../models/TopRatedRespons.dart';
import '../../../shared/components/constant.dart';
import '../../details/screen/movies_details.dart';


class PopularDataItem extends StatefulWidget {
  Results results ;
  PopularDataItem({required this.results});

  @override
  State<PopularDataItem> createState() => _PopularDataItemState();
}

class _PopularDataItemState extends State<PopularDataItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){Navigator.of(context)
            .pushNamed(MoviesDetails.routeName,
            arguments: widget.results);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageBaseURL +
                ((widget.results.backdropPath) ??
              '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                height: 120,width: 80,fit: BoxFit.fitHeight,),
            ),
        Positioned(
          left: 0,
          right: 60,
          top: 0,
          bottom: 90,
          child: InkWell(
              onTap: (){
               // add to watch
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children:[ 
                  Image.asset("assets/images/addToList.png",width: 35,height: 50,),
                  // firebase Condition
                  const  Padding(
                    padding:  EdgeInsets.only(top: 3),
                    child: Icon(Icons.add, color: Colors.white,size: 16,),
                  )
      
                ] ),),
        )
          ],
        ),
      ),
    );
  }

  
}