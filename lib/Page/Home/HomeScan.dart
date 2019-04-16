import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode/Page/Capture/CaptureCode.dart';


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
        actions: <Widget>[
          IconButton(
            iconSize: 40,
            icon: Icon(Icons.add_circle),
            tooltip: 'Scanear Codigo',
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Capture()),
              );
            },
          ),
        ],
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
        Text('HOlaaaaaa'),
        Text('22222222'),
        ],
      controller: _controller,
    );
  }
}

