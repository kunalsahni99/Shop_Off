import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../transitions/slide_top_route.dart';
import 'prod_cat.dart';

class Categories extends StatelessWidget {
  final String type;

  Categories({this.type});

  final List<Category> men = [
    Category(
      title: 'T-Shirts',
      img: 'images/categories/t_shirts.jpg',
    ),
    Category(
      title: 'Men Shoes',
      img: 'images/categories/men_shoes.jpg'
    ),
    Category(
      img: 'images/categories/two_piece.jpg',
      title: 'Two Piece'
    ),
    Category(
      img: 'images/categories/men_jeans.jpg',
      title: 'Men Jeans'
    ),
    Category(
      img: 'images/categories/sweatshirts.jpg',
      title: 'Sweatshirts'
    ),
    Category(
      img: 'images/categories/men_eyewear.jpg',
      title: 'Men Eyewear'
    ),
    Category(
      img: 'images/categories/men_shorts.jpg',
      title: 'Men Shorts'
    )
  ];
  final List<Category> women = [
    Category(
      img: 'images/categories/blouses.jpg',
      title: 'Blouses'
    ),
    Category(
      img: 'images/categories/bras.jpg',
      title: 'Bras'
    ),
    Category(
      img: 'images/categories/coats.jpg',
      title: 'Coats'
    ),
    Category(
      img: 'images/categories/denim.jpg',
      title: 'Denim'
    ),
    Category(
      img: 'images/categories/dresses.jpg',
      title: 'Dresses'
    ),
    Category(
      img: 'images/categories/ethnic.jpg',
      title: 'Ethnic'
    ),
    Category(
      img: 'images/categories/eyewear.jpg',
      title: 'Eyewear'
    ),
    Category(
      img: 'images/categories/jackets.jpg',
      title: 'Jackets'
    ),
    Category(
      img: 'images/categories/jeans.jpg',
      title: 'Jeans'
    ),
    Category(
      img: 'images/categories/jump_suits.jpg',
      title: 'Jumpsuits'
    ),
    Category(
      img: 'images/categories/one_piece.jpg',
      title: 'One Piece'
    ),
    Category(
      img: 'images/categories/shirts.jpg',
      title: 'Shirts'
    ),
    Category(
      img: 'images/categories/shoes.jpg',
      title: 'Shoes'
    ),
    Category(
      img: 'images/categories/shorts.jpg',
      title: 'Shorts'
    ),
    Category(
      img: 'images/categories/skirts.jpg',
      title: 'Skirts'
    ),
    Category(
      img: 'images/categories/tops.jpg',
      title: 'Tops'
    ),
  ];
  final List<Category> access = [
    Category(
      img: 'images/categories/bags.jpg',
      title: 'Bags'
    ),
    Category(
      img: 'images/categories/jewellery.jpg',
      title: 'Jewellery'
    ),
    Category(
      img: 'images/categories/makeup.jpg',
      title: 'Makeup'
    )
  ];

  @override
  Widget build(BuildContext context) {
    switch (type){
      case 'Men':
        return buildGrid(men);
        break;
      case 'Women':
        return buildGrid(women);
        break;
      case 'Accessories':
        return buildGrid(access);
        break;
      default: return null;
    }
  }

  Widget buildGrid(List<Category> list){
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 5.0),
        shrinkWrap: true,
        itemCount: list.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0
        ),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            splashColor: Colors.white,
            focusColor: Colors.white,
            highlightColor: Colors.white,
            onTap: (){
              Navigator.push(context, SlideTopRoute(page: ProductCategory(category: list[index].title)));
            },
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(list[index].img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(list[index].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}

class Category{
  String img, title;

  Category({this.title, this.img});
}