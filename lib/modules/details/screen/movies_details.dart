import 'package:flutter/material.dart';
import 'package:movies_app/modules/details/item/movies_details_item.dart';
import 'package:movies_app/shared/components/add_firebase.dart';
import '../../../../../models/TopRatedRespons.dart';
import '../../../../../shared/components/constant.dart';

class MoviesDetails extends StatefulWidget {
  static const String routeName = 'Top_Detail';

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    var results = ModalRoute.of(context)!.settings.arguments as Results;
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xff1A1A1A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            results.title ?? '',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Color(0xff1A1A1A)),
          child:
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          InkWell(
                            onTap: () {
                              results.video =  true ;
                              setState(() {
                                
                              });
                              // Add watched list
                              AddFirebase.addToFirebase(
                                context: context,
                                backdropPath: results.backdropPath,
                                id: results.id,
                                overview: results.overview,
                                releaseDate: results.releaseDate,
                                title: results.title,
                                video: results.video,
                                voteAverage: results.voteAverage,
                                
                                );
                            },
                            child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.network(
                                              imageBaseURL + ('${results.backdropPath}'),
                                              height: MediaQuery.of(context).size.height * .3,
                                              width: double.infinity,
                                            ),
                                            Center(child: Image.asset('assets/images/play.png')),
                                          ],
                            ),
                          ),
                          SizedBox(
                height: size.height * .01,
                          ),
                          Text(
                results.title ?? '',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textAlign: TextAlign.start,
                          ),
                          SizedBox(
                height: size.height * .01,
                          ),
                          Text(results.releaseDate!,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
                          SizedBox(
                height: size.height * .03,
                          ),
                          Padding(
                    padding:  EdgeInsets.only(
                    right: size.width *0.01
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            imageBaseURL + ('${results.posterPath}') ?? '',
                            height: MediaQuery.of(context).size.height*.22,
                            width: MediaQuery.of(context).size.width*.34,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top:0,
                          right: 90,
                          bottom: 140,
                          child: Stack(
                              alignment: Alignment.topCenter,
                              children: [ results.video == true ?
                                Image.asset(
                                  "assets/images/addToList.png",
                                  width: 35,
                                  height: 50,
                                  color: const Color(0xffF7B539),)
                                  :Image.asset(
                                  "assets/images/addToList.png",
                                  width: 35,
                                  height: 50,),
                                // firebase Condition
                                 Padding(
                                  padding:const EdgeInsets.only(top: 2),
                                  child: results.video == true ?const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 22,
                                  ):const  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(width:size.width*.02,),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            results.overview!,
                            style:const TextStyle(fontSize: 14,
                              height: 1.3,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                             const  Icon(Icons.star,color: Colors.amber,size: 16,),
                             const  SizedBox(width: 5,),
                              Text('${results.voteAverage!}',style:
                             const  TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                
                            ],
                          ),
                
                        ],
                      ),
                
                    )
                  ],
                        ),
                ),
                          SizedBox(height: size.height * 0.02,),
                          Container(
                            height: size.height * 0.4,
                            child: MoviesDetailsItem(results.id!)),
                        ],),
              ),
        ));
  }
}
