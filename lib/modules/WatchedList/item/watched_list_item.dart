import 'package:flutter/material.dart';
import 'package:movies_app/models/watch_list_model.dart';

import '../../../shared/components/constant.dart';


class WatchedListItem extends StatelessWidget {
  WatchListModel watchedList ;
  WatchedListItem({required this.watchedList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageBaseURL +
                      ((watchedList.backdropPath) ??
                          '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                  height: 90,
                  width: 140,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                right: 112,
                left: 0,
                top: 0,
                bottom: 54,
               child: InkWell(
                onTap: (){
                  //todo : add to fire base
                },
                child: Stack(
                  alignment: Alignment.topCenter,
                  children:[
                    Image.asset("assets/images/addToList.png",width: 35,height: 50,color: Colors.amberAccent,),
                    // firebase Condition
                    const Icon(Icons.check, color: Colors.white,size: 28,)

                  ] ),),
          )
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(watchedList.title ?? 'Film',
                         style:const  TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 6,),
                    Text(watchedList.releaseDate ?? '2022',
                         style:const  TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.normal)),
                    const SizedBox(height: 6,),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amberAccent,size: 14,),
                        const SizedBox(width: 6,),
                        Text('${watchedList.voteAverage}' ,
                             style:const  TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.normal)),
                      ],
                    ),
            
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(height: 8,color:Color.fromARGB(255, 245, 241, 241) ,)   
        ],
      ),
    );
  }
}