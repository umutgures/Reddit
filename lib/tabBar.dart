import 'package:flutter/material.dart';
import 'package:reddit/models/api_models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class tabBar extends StatefulWidget {
  @override
  _tabBarState createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> with SingleTickerProviderStateMixin{
  TabController _controller;
  String url="https://www.reddit.com/r/flutterdev/top.json?count=20";
  Reddit reddit;
  Future<Reddit> veri1;

  Future<Reddit> redditVeriGetir() async {

    var response=await http.get(url);
    var decodedJson=json.decode(response.body);
    reddit=Reddit.fromJson(decodedJson);
    return reddit;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    veri1=redditVeriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: TabBarContainer(),
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          FutureBuilder(
            future: veri1,
            builder: (context,AsyncSnapshot<Reddit> gelenVeri){
              if(gelenVeri.connectionState==ConnectionState.waiting){
                //Henüz bir veri gelmemişse
                return Center(child: CircularProgressIndicator());
              }
              else if((gelenVeri.connectionState==ConnectionState.done)) {
                //İşlem bitmişse
                return ListView.builder(
                    itemCount: gelenVeri.data.data.children.length,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 6,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/12,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/50,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/9,
                                    height: MediaQuery.of(context).size.height/12,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage("assets/profile.png")
                                          )
                                      )
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.45,
                                    height: MediaQuery.of(context).size.height/12,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height/65,
                                        ),
                                        Text(gelenVeri.data.data.children[index].data.subredditNamePrefixed,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/25),),
                                        Text("Posted by ${gelenVeri.data.data.children[index].data.subredditNamePrefixed}  18h",style: TextStyle(color:Colors.grey,fontSize: MediaQuery.of(context).size.width/26),)
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/11,
                                    height: MediaQuery.of(context).size.height/25,
                                    decoration: BoxDecoration(
                                        color:Colors.blue[900],
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                  Icon(Icons.more_vert,color: Colors.grey,)
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/18,
                              child: Row(
                                  children: [
                                    Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                    Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                    Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                    Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                    Text("91 Awards",style: TextStyle(color:Colors.grey,fontSize: MediaQuery.of(context).size.width/26),)
                                  ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/15,
                              child: Text(
                                gelenVeri.data.data.children[index].data.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3.5,
                              decoration: BoxDecoration(
                                  image :DecorationImage(
                                      image: gelenVeri.data.data.children[index].data.thumbnail=="self"?AssetImage("assets/Reddit-Amblem.png"):NetworkImage(gelenVeri.data.data.children[index].data.thumbnail),
                                    fit: BoxFit.fill
                                  )
                              ),
                              //child: FadeInImage.assetNetwork(placeholder: "assets/giphy.gif", image: ==null?"assets/Reddit-Amblem.png":gelenVeri.data.data.children[index].data.thumbnail,fit: BoxFit.fill,),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/15,
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_upward,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "36,8",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                    ),
                                  ),
                                  Icon(Icons.arrow_downward,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/12,
                                  ),
                                  Icon(Icons.mode_comment_outlined,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "976",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/12,
                                  ),
                                  Icon(Icons.share,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/12,
                                  ),
                                  Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "Award",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
              else{
                return Text("Hata");
              }
            },
          ),
          FutureBuilder(
            future: veri1,
            builder: (context,AsyncSnapshot<Reddit> gelenVeri){
              if(gelenVeri.connectionState==ConnectionState.waiting){
                //Henüz bir veri gelmemişse
                return Center(child: CircularProgressIndicator());
              }
              else if((gelenVeri.connectionState==ConnectionState.done)) {
                //İşlem bitmişse
                return ListView.builder(
                    itemCount: gelenVeri.data.data.children.length,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 6,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/12,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/50,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width/9,
                                      height: MediaQuery.of(context).size.height/12,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage("assets/profile.png")
                                          )
                                      )
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.45,
                                    height: MediaQuery.of(context).size.height/12,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height/65,
                                        ),
                                        Text(gelenVeri.data.data.children[index].data.subredditNamePrefixed,style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/25),),
                                        Text("Posted by ${gelenVeri.data.data.children[index].data.subredditNamePrefixed}  18h",style: TextStyle(color:Colors.grey,fontSize: MediaQuery.of(context).size.width/26),)
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/11,
                                    height: MediaQuery.of(context).size.height/25,
                                    decoration: BoxDecoration(
                                        color:Colors.blue[900],
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                  Icon(Icons.more_vert,color: Colors.grey,)
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/18,
                              child: Row(
                                children: [
                                  Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                  Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                  Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                  Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/35,),
                                  Text("91 Awards",style: TextStyle(color:Colors.grey,fontSize: MediaQuery.of(context).size.width/26),)
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/15,
                              child: Text(
                                gelenVeri.data.data.children[index].data.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3.5,
                              decoration: BoxDecoration(
                                  image :DecorationImage(
                                      image: gelenVeri.data.data.children[index].data.thumbnail=="self"?AssetImage("assets/Reddit-Amblem.png"):NetworkImage(gelenVeri.data.data.children[index].data.thumbnail),
                                      fit: BoxFit.fill
                                  )
                              ),
                              //child: FadeInImage.assetNetwork(placeholder: "assets/giphy.gif", image: ==null?"assets/Reddit-Amblem.png":gelenVeri.data.data.children[index].data.thumbnail,fit: BoxFit.fill,),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/15,
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_upward,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "36,8",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(Icons.arrow_downward,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/12,
                                  ),
                                  Icon(Icons.mode_comment_outlined,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "976",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/12,
                                  ),
                                  Icon(Icons.share,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/12,
                                  ),
                                  Icon(Icons.card_giftcard,color: Colors.grey,size: MediaQuery.of(context).size.height/25,),
                                  Text(
                                    "Award",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
              else{
                return Text("Hata");
              }
            },
          ),
        ],
      ),
    );
  }


  Container TabBarContainer(){
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/15,
        child:TabBar(
          controller: _controller,
          indicatorColor: Colors.blue,
          automaticIndicatorColorAdjustment: false,
          tabs: [
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/15,
              child: Center(child: Text("Home",style: TextStyle(color: Colors.black))),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/15,
              child: Center(child: Text("Popular",style: TextStyle(color: Colors.black))),
            ),
          ],
        )
    );
  }

}
