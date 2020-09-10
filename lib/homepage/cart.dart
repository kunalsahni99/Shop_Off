import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: SvgPicture.asset('images/assets/back.svg', color: Colors.white),
                  onPressed: () => Navigator.pop(context),
              ),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: Size(50.0, 50.0),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text('My Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                  ),
                ),
              ),
            )
          ];
        },

        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            CartProduct(),
            CartProduct(),
            CartProduct(),
            CartProduct(),
            CartProduct(),
            CartProduct(),
            CartProduct(),
            CartProduct(),
            CartProduct(),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total: ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22.0
                    ),
                  ),

                  Text('₹ 50.00',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700
                    ),
                  )
                ],
              ),
            ),

            InkWell(
              splashColor: Colors.white,
              highlightColor: Colors.white,
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 5.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50.0)
                ),

                child: Text('CHECKOUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartProduct extends StatefulWidget {

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/categories/denim.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Something',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('₹ 10.00',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15.0
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(LineIcons.minus,
                        color: Colors.black,
                        size: 15.0,
                      ),
                      onPressed: (){},
                    ),

                    Container(
                      alignment: Alignment.center,
                      width: 30.0,
                      child: Text('1')
                    ),

                    IconButton(
                      icon: Icon(LineIcons.plus,
                        color: Colors.black,
                        size: 15.0,
                      ),
                      onPressed: (){},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
