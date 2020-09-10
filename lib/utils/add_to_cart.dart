import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'prefs.dart';

class AddToCart extends StatefulWidget {
  final String pUrl, pName;

  AddToCart({this.pUrl, this.pName});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  //todo: have to restrict currQty in 1 to 25
  int currQty = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Image.asset(widget.pUrl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height - 60.0,
                  ),
                  Container(
                    color: Colors.black,
                    height: 60.0,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: Text('MORE INFO',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text('ADD TO CART',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0
                ),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
              //todo: use layout builder to place this column accordingly
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight >= 660 ? 15.0 : 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      height: 500.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(widget.pUrl,
                                  width: 100.0,
                                  height: 100.0,
                                ),
                              ),

                              Expanded(
                                child: Text(widget.pName,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            indent: 30.0,
                            endIndent: 30.0,
                            thickness: 1.05,
                          ),
                          Text('SELECT SIZE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Prefs().sizeTag('7'),
                              Prefs().sizeTag('8'),
                              Prefs().sizeTag('9'),
                              Prefs().sizeTag('10')
                            ],
                          ),
                          Text('SELECT QTY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: IconButton(
                                    icon: Icon(LineIcons.minus_circle, size: 30.0),
                                    onPressed: (){
                                      setState(() => currQty--);
                                    },
                                  ),
                                ),
                                Text(currQty.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 30.0),
                                  child: IconButton(
                                    icon: Icon(LineIcons.plus_circle, size: 30.0),
                                    onPressed: (){
                                      setState(() => currQty++);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              height: 50.0,
                              margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              child: Center(
                                child: Text('ADD TO CART',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}