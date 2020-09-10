import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double height, width;
  bool isOpen;

  @override
  void initState() {
    super.initState();
    isOpen = false;
    height = 0.0;
    width = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: GestureDetector(
              onTap: (){
                if (isOpen){
                  setState((){
                    isOpen = false;
                    width = 0.0;
                    height = 0.0;
                  });
                }
              },
              child: SearchBar<ProductDetail>(
                onSearch: (String value){},
                onItemFound: (ProductDetail detail, int index){},
                searchBarPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                searchBarStyle: SearchBarStyle(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(200.0), topLeft: Radius.circular(200.0)),
                  color: Colors.black54.withOpacity(0.25)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
//                    Padding(
//                      padding: EdgeInsets.only(top: 20.0),
//                      child: Column(
//                        children: [
//                          Text('Filter',
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 19.0
//                            ),
//                          ),
//
//                        ],
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.bottomLeft,
//                      child: GestureDetector(
//                        onTap: (){},
//                        child: Padding(
//                          padding: EdgeInsets.only(left: 20.0),
//                          child: Row(
//                            children: [
//                              SvgPicture.asset('images/assets/back.svg', color: Colors.white),
//                              Padding(
//                                padding: EdgeInsets.only(left: 10.0),
//                                child: Text('back',
//                                  style: TextStyle(
//                                    color: Colors.white
//                                  ),
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            isOpen = !isOpen;
            if (isOpen){
              width = MediaQuery.of(context).size.width;
              height = MediaQuery.of(context).size.height / 2;
            }
            else{
              width = 0.0;
              height = 0.0;
            }
          });
        },
        backgroundColor: isOpen ? Colors.white : Colors.black,
        elevation: 2.0,
        child: isOpen ? Text('OK',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ) :
        Icon(Icons.filter_list, color: Colors.white),
      ),
    );
  }
}

class ProductDetail{
  final String pUrl, pName;

  ProductDetail(this.pName, this.pUrl);
}