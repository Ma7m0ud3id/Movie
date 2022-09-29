import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/Latest_movie.dart';
import '../../models/TopRatedRespons.dart';
import '../../models/category_movie.dart';
import '../../models/filtred_movies.dart';
import '../../models/movies_respose.dart';
import '../../models/search_model.dart';
import '../../models/similler_response.dart';
import '../components/constant.dart';

class ApiManager{
  static Future<MoviesResponse> getMoviesPopular()async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/popular",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= MoviesResponse.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
  static Future<LatestMovie> getMovieslatest()async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/latest",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= LatestMovie.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
  static Future<TopRatedRespons> getMoviesTopRated()async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/top_rated",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= TopRatedRespons.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
  // Get Film Searched
  static Future<SearchModel> getSearch(String q)async{
    var uri= Uri.https("api.themoviedb.org", "/3/search/movie",{
      "api_key" : "8447f6d466cb085704029ad005725822",
      "query":q
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= SearchModel.fromJson(json);
      
      return res;
      
    }catch (e){
      throw e;
    }

  }


  // get Category Movies
  static Future <CategoryMovie> getCategory() async {
    var url = Uri.https(BASEURL, '/3/genre/movie/list', {
      "api_key": APIKEY,
    });

    try {

      var response = await http.get(url);

      var bodyCategory = response.body;

      var json = jsonDecode(bodyCategory);

      return  CategoryMovie.fromJson(json);
    } catch (e) {

      throw e;
    }
  }

// get Filtered Movies
  static Future <FiltredMovies> getFiltered(String genres) async {
    var url = Uri.https(BASEURL, '/3/discover/movie', {
      "api_key": APIKEY,
      "with_genres": genres,
    });

    try {

      var response = await http.get(url);

      var bodyCategory = response.body;

      var json = jsonDecode(bodyCategory);

      return  FiltredMovies.fromJson(json);
    } catch (e) {

      throw e;
    }
  }


  static Future<SimillarResponse> getMoviesSimilar(int id)async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/${id}/similar",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= SimillarResponse.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }

}


