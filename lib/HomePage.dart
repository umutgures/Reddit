import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:reddit/tabBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int secilenIndex=0;
  Color secilenColor=Colors.black;
  HomePage anaSayfa;
  HomePage arama;
  HomePage bildirim;
  HomePage profil;
  HomePage mesaj;
  List<Widget> tumSayfalar;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anaSayfa=HomePage();
    arama=HomePage();
    bildirim=HomePage();
    profil=HomePage();
    mesaj=HomePage();
    tumSayfalar=[anaSayfa,arama,mesaj,bildirim,profil];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: SearchBar(),
        ),
        backgroundColor: Colors.white,
      ),
        body: tabBar(),
        bottomNavigationBar:BottomNavigatorBar(context)
    );
  }


  BottomNavigationBar BottomNavigatorBar(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,size: MediaQuery.of(context).size.width/13,),label: "Ana Sayfa",),
        BottomNavigationBarItem(icon: Icon(Icons.search,size: MediaQuery.of(context).size.width/13),label: "Arama"),
        BottomNavigationBarItem(icon: Icon(Icons.add,size: MediaQuery.of(context).size.width/13),label: "Arama"),
        BottomNavigationBarItem(icon: Icon(Icons.message,size: MediaQuery.of(context).size.width/13),label: "Mesajlar"),
        BottomNavigationBarItem(icon: Icon(Icons.add,size: MediaQuery.of(context).size.width/13),label: "Profil"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: secilenIndex,
      unselectedItemColor: Colors.black26,
      selectedItemColor: Colors.black,
      onTap: (index){
        setState(() {
          secilenIndex=index;
          secilenColor=Colors.green;
        });
      },
    );
  }

  SearchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Mdi.account,
              color: Colors.black,
              size: MediaQuery.of(context).size.width/11,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white24,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width/22,
              height: MediaQuery.of(context).size.height/22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/dollar.png")
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
