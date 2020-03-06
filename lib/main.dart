import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

_callJon() async {
  const url = 'tel:+14436552140';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_emailJon() async {
  const addy = 'mailto:jredgeworth@gmail.com?subject=FromApp';
  if (await canLaunch(addy)) {
    await launch(addy);
  } else {
    throw 'Could not launch $addy';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[400],
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/f150-lion_wp1.png'),
              ),
              Text(
                'Jon Edgeworth',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Bangers',
                ),
              ),
              Text('Flutter Developer',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25.0,
                    fontFamily: 'PermanentMarker',
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Card(
                  color: Colors.black,
                  margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: _callJon,
                      child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          title: Text('+1-443-655-2140',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ))),
                    ),
                  )),
              Card(
                color: Colors.black,
                margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 5.0),
                // padding: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: _emailJon,
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      title: Text('jredgeworth@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
