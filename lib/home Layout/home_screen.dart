import 'package:flutter/material.dart';
import '../modules/Search/screen/Search.dart';
import '../modules/WatchedList/screen/watch_list_screen.dart';
import '../modules/browser/Screen/browser_screen.dart';
import '../modules/home/home_screen.dart';


class HomePage extends StatefulWidget {
 static const String routename= "Home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int neindex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:const  Color(0xff121312),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:const  Color(0xff1A1A1A)
        ),
        child: BottomNavigationBar(
          onTap: (index){
            neindex=index;
            setState((){});
          },
          currentIndex: neindex,
          items: const [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home_icon.png')),label: "Home"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/search.png')),label: "Search",),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/browser_icon.png')),label: "Browse"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/watch_list_icon.png')),label: "WatchList"),
          ],
        ),
      ),
      body: tabs[neindex],
    );
  }
  List<Widget> tabs=[
   const  HomeScreen(),
    SearchScreen(),
    BrowserScreen(),
   const  WachListScreen()
  ];
}

//8447f6d466cb085704029ad005725822
