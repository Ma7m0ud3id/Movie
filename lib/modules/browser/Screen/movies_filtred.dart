import 'package:flutter/material.dart';
import 'package:movies_app/modules/browser/Item/filtred_item.dart';
import '../../../models/category_movie.dart';
import '../../../models/filtred_movies.dart';
import '../../../shared/network/api_manager.dart';

class MoviesFiltred extends StatelessWidget {
  static const String routeName = 'movies_flitred';

  @override
  Widget build(BuildContext context) {
    var sharched = ModalRoute.of(context)?.settings.arguments as Genres;
    Image playImage = Image.asset('assets/images/flim-play.png',);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('${sharched.name}',style: const  TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
        ),
       backgroundColor: Colors.transparent,
      ),
      body: Column(
      children: [
        Expanded(
          child: FutureBuilder<FiltredMovies>(
            future: ApiManager.getFiltered('${sharched.id}'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Somithing went wrong'),
                          ),
                        );
                      } else if (snapshot.data?.success == false) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Try again'),
                          ),
                        );
                      }
                      var listResult = snapshot.data?.results ?? [];
                      return ListView.builder(
                        itemCount: listResult.length,
                        itemBuilder: (context, index) {
                          
                          return FiltredItem(results: listResult[index],
                          name: sharched.name, playImage: playImage,);
                        },);
            },),
        ),
      ],
    ),
    );
    
  }

  
}

