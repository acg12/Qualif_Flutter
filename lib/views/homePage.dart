import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'itemsPage.dart';
import 'loginPage.dart';
import '../utils/globals.dart' as globals;

class homePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<homePage> {
  void _onPressed(BuildContext context, var destination) {
    if (destination == 'products') {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return itemsPage();
      }));
    } else if (destination == "logout") {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return loginPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      child: Scaffold(
          appBar: AppBar(
            title: Text(""),
            backgroundColor: (globals.darkTheme) ? Colors.grey[850] : Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
                color: (globals.darkTheme) ? Colors.white : Colors.pink),
            actions: [
              PopupMenuButton(
                color: (globals.darkTheme) ? Colors.grey[800] : Colors.white, 
                itemBuilder: (context) {
                  return ['Toggle Theme'].map((e) {
                    return PopupMenuItem(
                      child: TextButton(
                          child: Text("Toggle Theme"),
                          onPressed: () {
                            setState(() {
                              globals.darkTheme = !globals.darkTheme;
                            });
                          }));
                }).toList();
              }),
            ],
          ),
          drawer: Drawer(
            child: Container(
            child: Column(children: [
              ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 50,
                    minHeight: 50,
                    maxWidth: 80,
                    maxHeight: 80,
                  ),
                  child: Image.asset(
                    'assets/account.png',
                  )),
              Container(
                  child: Text(globals.username,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  padding: EdgeInsets.all(16)),
              ListTile(
                  leading: TextButton(
                child: Text("Home"),
                onPressed: () => _onPressed(context, "home"),
              )),
              ListTile(
                  leading: TextButton(
                child: Text("View Products"),
                onPressed: () => _onPressed(context, "products"),
              )),
              ListTile(
                  leading: TextButton(
                child: Text("Settings"),
                onPressed: () => _onPressed(context, "settings"),
              )),
              ListTile(
                  title: Container(
                      child: TextButton(
                        child: Text("Logout"),
                        onPressed: () => _onPressed(context, "logout"),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            side: BorderSide(width: 3.0, color: Colors.pink),
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 8)),
                      ),
                      margin: EdgeInsets.only(top: 30))),
            ], mainAxisAlignment: MainAxisAlignment.center),
            padding: EdgeInsets.fromLTRB(0, 50, 16, 50),
            color: (globals.darkTheme) ? Colors.grey[850] : Colors.white
          )
        ),
        body: ListView(
          children: [
              Container(
                child: CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/carousel/1.PNG'),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/carousel/2.PNG'),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/carousel/3.PNG'),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 7),
                  ),
                ),
              margin: EdgeInsets.only(top: 8, bottom: 16)
            ),
            Container(
              
            )
          ]
        )
      ),
        data: (globals.darkTheme) ? ThemeData(
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: Colors.grey[850],
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pink[100]
          )
        ) : ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pink
          )
        )
    );
  }
}
