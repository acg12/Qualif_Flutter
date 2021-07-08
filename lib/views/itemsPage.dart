import 'package:flutter/material.dart';
import '../utils/globals.dart' as globals;
import 'homePage.dart';
import 'itemDetailPage.dart';
import 'loginPage.dart';

class itemsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return itemsPageState();
  }
}

class itemsPageState extends State<itemsPage> {
  void _onPressed(BuildContext context, var destination) {
    if (destination == 'home') {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return homePage();
      }));
    } else if (destination == "logout") {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return loginPage();
      }));
    }
  }

  void _clickProduct(BuildContext context, int idx) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (builder) {
        return itemDetailPage(idx);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
        child: Scaffold(
          appBar: AppBar(
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
            backgroundColor:
                (globals.darkTheme) ? Colors.grey[850] : Colors.white,
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
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  side: BorderSide(
                                      width: 3.0, color: Colors.pink),
                                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8)),
                            ),
                            margin: EdgeInsets.only(top: 30))),
                  ], mainAxisAlignment: MainAxisAlignment.center),
                  padding: EdgeInsets.fromLTRB(0, 50, 16, 50),
                  color:
                      (globals.darkTheme) ? Colors.grey[850] : Colors.white)),
          body: Container(
            child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(8, (index) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: (globals.darkTheme)
                              ? Colors.grey[850]
                              : Colors.white,
                          padding: EdgeInsets.all(0)),
                      onPressed: () => _clickProduct(context, index),
                      child: SizedBox(
                          height: double.infinity,
                          child: Card(
                            child: Container(
                              child: Column(
                                children: [
                                  ConstrainedBox(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                        child: Image.asset(
                                            'assets/${globals.products[index][0]}',
                                            fit: BoxFit.cover)),
                                    constraints: BoxConstraints(
                                        minWidth: 180,
                                        minHeight: 120,
                                        maxWidth: 180,
                                        maxHeight: 120),
                                  ),
                                  Container(
                                      child: Column(
                                          children: [
                                            Text(
                                                "${globals.products[index][1]}",
                                                style: TextStyle(fontSize: 20)),
                                            Text(globals.products[index][2],
                                                style: TextStyle(fontSize: 15))
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start),
                                      margin: EdgeInsets.only(left: 16))
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ),
                            elevation: 6.0,
                            margin: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            color: (globals.darkTheme)
                                ? Colors.grey[800]
                                : Colors.white,
                          )));
                })),
            margin: EdgeInsets.all(16),
          ),
        ),
        data: (globals.darkTheme)
            ? ThemeData(
                primarySwatch: Colors.grey,
                scaffoldBackgroundColor: Colors.grey[850],
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.white,
                    ),
                buttonTheme: ButtonThemeData(buttonColor: Colors.white))
            : ThemeData(
                primarySwatch: Colors.pink,
                scaffoldBackgroundColor: Colors.white,
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: Colors.black,
                      displayColor: Colors.black,
                    ),
                buttonTheme: ButtonThemeData(buttonColor: Colors.white)));
  }
}
