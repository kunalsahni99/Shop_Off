import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_flip_view/flutter_flip_view.dart';

import '../utils/orders.dart';
import '../login/main_login.dart';
import '../transitions/slide_left_route.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{
  final border = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );
  AnimationController animationController;
  Animation<double> curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void flip(bool reverse){
    if (animationController.isAnimating) return;
    if (reverse){
      animationController.forward();
    }
    else{
      animationController.reverse();
    }
  }

  Widget buildCard(Widget child, GestureTapCallback onTap){
    return AspectRatio(
      aspectRatio: 2,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.black54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.1),
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              onTap: onTap,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
          body: ListView(
            children: [
              //todo: header
              Container(
                width: double.infinity,
                height: constraints.maxHeight >= 660 ? MediaQuery.of(context).size.height / 2.25 : MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Transform.rotate(
                      angle: pi,
                      child: WaveWidget(
                        waveFrequency: 2.0,
                        config: CustomConfig(
                          gradients: [
                            [Colors.black, Colors.black54],
                            [Colors.black54, Colors.black45],
                            [Colors.black45, Colors.black38],
                            [Colors.black38, Colors.black26]
                          ],
                          gradientBegin: Alignment.bottomLeft,
                          gradientEnd: Alignment.topRight,
                          durations: [35000, 19440, 10800, 6000],
                          heightPercentages: [0.05, 0.05, 0.05, 0.05],
                        ),
                        size: Size(double.infinity, double.infinity),
                        backgroundColor: Colors.transparent,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 40.0),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          AvatarGlow(
                            endRadius: 100.0,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: AssetImage('images/categories/denim.jpg'),
                                ),

                                Positioned(
                                  right: 0.0,
                                  bottom: 0.0,
                                  child: InkWell(
                                    //todo: add change profile function
                                    onTap: (){},
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(FontAwesomeIcons.plus, size: 18.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Someone\'s profile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17.0
                                  ),
                                ),

                                IconButton(
                                  splashColor: Colors.white.withOpacity(0.1),
                                  highlightColor: Colors.transparent,
                                  icon: Icon(Icons.edit, color: Colors.white),
                                  onPressed: (){

                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Positioned(
                      top: 20.0,
                      right: 10.0,
                      child: FloatingActionButton.extended(
                        label: Text('Logout',
                          style: TextStyle(
                            color: Colors.black87
                          ),
                        ),
                        backgroundColor: Colors.white,
                        onPressed: (){
                          Navigator.push(context, SlideLeftRoute(page: MainLogin()));
                        },
                        icon: Icon(Icons.exit_to_app, color: Colors.black87),
                      ),
                    )
                  ],
                ),
              ),

              //todo: personal details
              FlipView(
                animationController: curvedAnimation,
                front: buildCard(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Icon(FontAwesomeIcons.phoneAlt, color: Colors.white, size: 20.0),
                        title: Text('MOBILE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0
                          ),
                        ),
                        subtitle: Text('0123456789',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      ListTile(
                        leading: Icon(FontAwesomeIcons.addressBook, color: Colors.white, size: 20.0),
                        title: Text('DELIVERY ADDRESS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0
                          ),
                        ),
                        subtitle: Text('23-C, MIG Flats, Madhuban Apartments, Sector 82, Noida',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  () => flip(true)
                ),
                back: buildCard(
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Icon(FontAwesomeIcons.phoneAlt, color: Colors.white, size: 20.0),
                            title: TextField(
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintText: 'Mobile',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white
                              ),
                            ),
                          ),

                          ListTile(
                            leading: Icon(FontAwesomeIcons.addressBook, color: Colors.white, size: 20.0),
                            title: TextField(
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  hintText: 'Address',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0
                                  ),
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border
                              ),
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.white
                              ),
                            ),
                          )

                        ],
                      ),
                      Positioned(
                        top: 10.0,
                        left: 20.0,
                        child: Text('Edit Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0
                          ),
                        ),
                      ),

                      Positioned(
                        top: 0.0,
                        right: 20.0,
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                  () => flip(false)
                ),
              ),

              //todo: my orders
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, SlideLeftRoute(page: MyOrders()));
                    },
                    splashColor: Colors.black.withOpacity(0.1),
                    highlightColor: Colors.transparent,
                    child: ListTile(
                      title: Text('My Orders',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}