import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../transitions/slide_top_route.dart';
import '../categories/prod_cat.dart';
import 'prefs.dart';
import 'add_to_cart.dart';
import 'sabt.dart';

class ProdDetails extends StatefulWidget {
  final String picUrl, pName;

  ProdDetails({this.picUrl, this.pName});

  @override
  _ProdDetailsState createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScrolled){
          return [
            SliverAppBar(
              title: SABT(
                child: Text(widget.pName),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(widget.picUrl,
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.width,
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Center(
                      child: SvgPicture.asset('images/assets/back.svg', color: Colors.black)
                    ),
                  ),
                ),
              ),
              actions: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Center(
                      child: Icon(Icons.shopping_cart, color: Colors.black)
                  )
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, color: Colors.black
                      )
                    ),
                  ),
                )

              ],
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              //todo: name of product
              ListTile(
                title: Text(widget.pName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

                trailing: Text('\$1.99',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Available Sizes',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.0
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Prefs().sizeTag('7'),
                          Prefs().sizeTag('8'),
                          Prefs().sizeTag('9'),
                          Prefs().sizeTag('10')
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Product Details',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.0
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Bullet(),
                            title: Text('Textile, leather and synthetic upper offers durability.'),
                          ),

                          ListTile(
                            leading: Bullet(),
                            title: Text('Phylon foam midsole gives cushioning and comfort.'),
                          ),

                          ListTile(
                            leading: Bullet(),
                            title: Text('Rubber pods help maintain the shape.'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Similar Products',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20.0
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 250.0,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          itemExtent: 200.0,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            SingleProduct(),
                            SingleProduct(),
                            SingleProduct(),
                            SingleProduct(),
                            SingleProduct(),
                            SingleProduct(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))
              ),
              child: Center(
                child: Text('MORE INFO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, SlideTopRoute(
                  page: AddToCart(pUrl: widget.picUrl, pName: widget.pName)
                ));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text('ADD TO CART',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}