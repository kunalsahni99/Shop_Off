import 'package:flutter/material.dart';

import '../categories/prod_cat.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled){
          return [
            SliverAppBar(
              elevation: 0.0,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text('Featured Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(50.0, 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.5)),
                      bottom: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.5))
                    )
                  ),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //todo: filter button
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.filter_list, color: Colors.black),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text('Filter'),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        color: Colors.grey.withOpacity(0.5),
                        height: 50.0,
                        width: 1.0,
                        
                      ),

                      //todo: sort by button
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sort, color: Colors.black),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text('Sort by'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          child: GridView(
            padding: EdgeInsets.only(bottom: 10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 11,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0
            ),
            shrinkWrap: true,
            children: [
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
            ]
          ),
        ),
      ),
    );
  }
}
