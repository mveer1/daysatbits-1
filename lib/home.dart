import 'dart:ui';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:daysatbits/Widgets/drawerUI.dart';
import 'package:flutter/material.dart';
import 'package:daysatbits/UI/AboutusUI.dart';
import 'package:daysatbits/UI/homeUI.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: new Scaffold(
        drawer: DrawerUI(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'For your Days at BITS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300, // light
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUsUI()));
                })
          ],
          backgroundColor: Colors.blue,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: ConnectivityWidgetWrapper(
          alignment: Alignment.bottomCenter,
          message: "PLease connect to the internet",
          disableInteraction: false,
          child: HomeUI(),
        ),
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey,
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(icon),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
