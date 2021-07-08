import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/globals.dart' as globals;
import 'itemsPage.dart';

class itemDetailPage extends StatefulWidget {
  var idx;

  itemDetailPage(this.idx);

  @override
  State<StatefulWidget> createState() {
    return itemDetailState(idx);
  }
}

class itemDetailState extends State<itemDetailPage> {
  var idx;
  var _ctrlreview = TextEditingController();

  itemDetailState(this.idx);

  void _back(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return itemsPage();
    }));
  }

  void _submitReview(BuildContext context) {
    if(_ctrlreview.text != "") {
      setState(() {
        globals.reviews.add({
          'username': globals.username,
          'review': _ctrlreview.text
        });
        _ctrlreview.text = "";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Review field must be filled!'),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => _back(context),
                  ),
                  backgroundColor:
                      (globals.darkTheme) ? Colors.grey[850] : Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(
                      color: (globals.darkTheme) ? Colors.white : Colors.pink),
                  bottom: TabBar(tabs: [
                    Tab(
                        child: Row(children: [
                      Icon(Icons.info,
                          color:
                              (globals.darkTheme) ? Colors.white : Colors.pink),
                      Text('Details',
                          style: TextStyle(
                            color: (globals.darkTheme)
                                ? Colors.white
                                : Colors.black,
                          ))
                    ], mainAxisAlignment: MainAxisAlignment.center)),
                    Tab(
                        child: Row(children: [
                      Icon(Icons.star_border_outlined, color: Colors.orange),
                      Text('Reviews',
                          style: TextStyle(
                            color: (globals.darkTheme)
                                ? Colors.white
                                : Colors.black,
                          ))
                    ], mainAxisAlignment: MainAxisAlignment.center))
                  ])),
              body: TabBarView(children: [
                Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: [
                  Container(
                    child: Image.asset('assets/product.jpg',
                        fit: BoxFit.fitWidth),
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                      top: 250,
                      left: -20,
                      child: Container(
                        child: SizedBox(
                          height: 400,
                          width: 450,
                          child: Card(
                            child: ListView(children: [
                              Container(
                                  child: Text('${globals.products[idx][1]}',
                                      style: TextStyle(fontSize: 30)),
                                  padding:
                                      EdgeInsets.only(left: 50, top: 40)),
                              Container(
                                  child: Text('${globals.products[idx][2]}',
                                      style: TextStyle(fontSize: 25)),
                                  padding:
                                      EdgeInsets.only(left: 50, top: 16)),
                              Container(
                                  height: 1,
                                  color: (globals.darkTheme) ? Colors.white : Colors.grey,
                                  width: 50,
                                  margin: EdgeInsets.only(
                                      left: 40, right: 40, top: 16)),
                              Container(
                                  child: Text(
                                    '${globals.products[idx][3]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  padding:
                                      EdgeInsets.only(left: 50, top: 16)),
                              Container(
                                  child: ElevatedButton(
                                    child: Text(
                                      'Order now',
                                      style: TextStyle(
                                        color: (globals.darkTheme) ? Colors.white : Colors.black,
                                      )
                                    ),
                                    onPressed: null,
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        padding: EdgeInsets.all(16)),
                                  ),
                                  margin:
                                      EdgeInsets.fromLTRB(50, 30, 50, 16),
                              ),
                            ]),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80)),
                            elevation: 20,
                            color: (globals.darkTheme) ? Colors.grey[850] : Colors.white,
                          ),
                      )))
                ]),
                ListView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write a review...'
                              ),
                              controller: _ctrlreview
                            ),
                            margin: EdgeInsets.only(bottom: 16)
                          ),
                          Container(
                            child: ElevatedButton(
                              child: Text('Submit'),
                              onPressed: () => _submitReview(context),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                                )
                              )
                            ),
                            width: double.infinity,
                          )
                        ]
                      ),
                      padding: EdgeInsets.fromLTRB(25, 8, 25, 8)
                    ),
                    Container(
                      child: Column(
                      children: List.generate(globals.reviews.length, (index) {
                        return Container(
                            child: ListTile(
                              leading: Column(
                                children: [
                                  Container(
                                      child: Text(
                                          'By: ${globals.reviews[index]['username']}',
                                          style: TextStyle(fontSize: 15)),
                                      margin: EdgeInsets.only(bottom: 8)),
                                  Text('${globals.reviews[index]['review']}',
                                      style: TextStyle(fontSize: 20))
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            padding: EdgeInsets.all(16));
                      }),
                    ))
                  ]
                )
                  ]
                )
              )),
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
