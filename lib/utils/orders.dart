import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Center(
                  child: SvgPicture.asset('images/assets/back.svg', color: Colors.black)
              ),
            ),
          ),
        ),
        title: Text('My Orders',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        itemBuilder: (context, index){
          return SingleOrder();
        },
        separatorBuilder: (context, index){
          return Divider(indent: 10.0, endIndent: 10.0, color: Colors.grey);
        },
        itemCount: 5,
      ),
    );
  }
}

class SingleOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.black.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: (){},
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/categories/bags.jpg'),
            radius: 20.0,
          ),
          title: Text('Gucci Bags',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w700,
              fontSize: 18.0
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text('Aug 23, 2020',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0
              ),
            ),
          ),
          trailing: Container(
            //todo: keep check on this width for responsiveness.
            width: 130.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Shipped',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text('1 item',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
                IconButton(
                  tooltip: 'Track your order',
                  icon: Icon(Icons.room),
                  onPressed: (){},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}