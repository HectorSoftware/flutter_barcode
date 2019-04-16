import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Capture/CaptureCode.dart';
import 'package:flutter_barcode/Page/Cards/Cards.dart';


class HomePagescan extends StatefulWidget {
  @override
  HomePagescanState createState() {
    return new HomePagescanState();
  }
}




class HomePagescanState extends State<HomePagescan>  with SingleTickerProviderStateMixin{

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: getTabBar(),
          title: Text("Scanner"),
        ),
        body: getTabBarView(),
    );
  }

  TabBar getTabBar(){
    return TabBar(
      tabs: <Tab>[
        Tab(icon: Icon(Icons.archive)),
        Tab(icon: Icon(Icons.linked_camera)),
      ],
      controller: _controller,
    );
  }
  TabBarView getTabBarView(){
    return TabBarView(
      children: <Widget>[
        CardAdd(),
        Capture(),
      ],
      controller: _controller,
    );
  }
}