import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class Prefs{
  bool retIOS() => foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

  Widget sizeTag(String size){
    return Container(
      width: 50.0,
      height: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          border: Border.all(
              color: Colors.black,
              width: 1.5
          ),
          color: Colors.white
      ),
      child: Center(
        child: Text(size,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

}