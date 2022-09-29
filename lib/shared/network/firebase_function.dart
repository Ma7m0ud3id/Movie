import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/watch_list_model.dart';

class FirebaseFunction {


// add Collection
  static CollectionReference<WatchListModel> addCollection() {
    CollectionReference<WatchListModel> collection = FirebaseFirestore.instance
        .collection('movie')
        .withConverter<WatchListModel>(
          fromFirestore: (snapshot, options) =>
              WatchListModel.fromJson(snapshot.data()),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }



// add movie to firebase

  static Future<void> addMovie(WatchListModel movie) {
    var docRef = addCollection().doc(movie.id.toString());
    return docRef.set(movie);
  }

  // get Movie 
  static Stream<QuerySnapshot<WatchListModel>> getMovie(){
   CollectionReference <WatchListModel> coll = addCollection();
   return coll.snapshots();

  }
}
