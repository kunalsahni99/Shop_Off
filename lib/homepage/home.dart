import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

import '../transitions/slide_top_route.dart';
import '../categories/categories.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _controller;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this
    );
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text('Shop Off'),
              actions: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideTopRoute(page: Cart()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0, top: 5.0),
                    child: Text('0',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                )
              ],
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size(50.0, 50.0),
                child: Container(
                  height: 40.0,
                  child: ShiftingTabBar(
                    controller: _controller,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Product Sans'
                    ),
                    tabs: [
                      ShiftingTab(
                        icon: Icon(FontAwesomeIcons.male,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        text: 'Men',
                      ),

                      ShiftingTab(
                          icon: Icon(FontAwesomeIcons.female,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          text: 'Women'
                      ),

                      ShiftingTab(
                          icon: Icon(FontAwesomeIcons.shoppingBag,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          text: 'Accessories'
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            Categories(type: 'Men'),
            Categories(type: 'Women'),
            Categories(type: 'Accessories'),
          ],
        ),
      )
    );
  }
}