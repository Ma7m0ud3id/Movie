import 'package:flutter/material.dart';
import 'package:movies_app/modules/details/screen/movies_details.dart';
import 'home Layout/home_screen.dart';
import 'modules/browser/Screen/movies_filtred.dart';
import 'package:firebase_core/firebase_core.dart';

main()async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.yellow
          )
      ),
      routes: {
        HomePage.routename : (context) => HomePage(),
        MoviesFiltred.routeName: (context) => MoviesFiltred(),
        MoviesDetails.routeName: (context) => MoviesDetails(),
        
      },
      initialRoute: HomePage.routename,
      debugShowCheckedModeBanner: false,
    );
  }
}
