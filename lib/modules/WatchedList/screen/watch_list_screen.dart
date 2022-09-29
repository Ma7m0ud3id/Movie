import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/watch_list_model.dart';

import '../../../shared/network/firebase_function.dart';
import '../item/watched_list_item.dart';

class WachListScreen extends StatelessWidget {
  const WachListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height *0.07),
      padding:EdgeInsets.symmetric(horizontal: size.height *0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('WatcheList',
                   style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
          Expanded(
            child: StreamBuilder<QuerySnapshot<WatchListModel>>(
              stream: FirebaseFunction.getMovie(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                var listMovie =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

                return ListView.builder(
                  itemCount: listMovie.length,
                  itemBuilder: (context, index) {
                    return WatchedListItem(
                      watchedList: listMovie[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
