import 'package:flutter/material.dart';
import '../../../shared/network/api_manager.dart';
import '../../../models/search_model.dart';
import '../Item/search_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

var formKey = GlobalKey<FormState>();

var searchcontroller = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  

  @override
  Widget build(BuildContext context) {
    Image playImage = Image.asset('assets/images/flim-play.png',);
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.06),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: searchcontroller,
                    // onChanged: (value) {
                    //   searchcontroller.text = value ;
                    // },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.white54,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                            color: Colors.white54,
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        prefixIcon: IconButton(
                            onPressed: () {
                              ApiManager.getSearch(searchcontroller.text);
                              setState(() {
                                
                              });
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        fillColor: const Color(0xff514F4F),
                        labelText: 'Search',
                        labelStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: FutureBuilder<SearchModel>(
                future: ApiManager.getSearch(searchcontroller.text),
                builder: (_, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const  Center(child: CircularProgressIndicator());
                  }
                  if (snapShot.hasError) {
                    return Column(
                      children: [
                        const Text('Something went wrong'),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Try Again')),
                      ],
                    );
                  }

                  var newsList = snapShot.data?.results ?? [];

                  if (newsList.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/no_movie.png"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'No movies found',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    );
                  }
                  return ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (c, index) {
                        return SearchItem(results: newsList[index],playImage: playImage,);
                        
                      });
                }),
          )
        ],
      ),
    );
  }

  
}
