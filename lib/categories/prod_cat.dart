import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../transitions/slide_left_route.dart';
import '../utils/prod_details.dart';

class ProductCategory extends StatefulWidget {
  final String category;

  ProductCategory({this.category});

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 10.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 50.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: SvgPicture.asset('images/assets/back.svg', height: 30.0, width: 30.0),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                widget.category,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),

          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 11,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0
            ),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
              SingleProduct(),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return InkWell(
          onTap: (){
            Navigator.push(context, SlideLeftRoute(page: ProdDetails(
              picUrl: 'images/categories/blouses.jpg',
              pName: 'Kedo Running shoes from Adidas',
            )
            ));
          },
          child: Container(
            child: Card(
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              elevation: 2.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                    child: Stack(
                      children: [
                        Image.asset('images/categories/two_piece.jpg',
                          width: MediaQuery.of(context).size.width,
                          height: constraints.maxHeight >= 660 ? 125.0 : 100.0,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10.0,
                          left: 10.0,
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Icon(Icons.favorite_border,
                                size: 20.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                    title: Text('\$1.99',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(FontAwesomeIcons.cartPlus,
                        size: 20.0,
                        color: Colors.black38,
                      ),
                      onPressed: (){},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text('Asos Design black blouse dnwovnwocnwovnw',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(thickness: 1.0),
                  Expanded(
                    flex: constraints.maxHeight >= 660 ? 2 : 1,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 100.0,
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Center(
                          child: Text('BUY NOW',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
