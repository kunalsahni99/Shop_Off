import 'package:flutter/material.dart';

class SABT extends StatefulWidget {
  final Widget child;

  SABT({
    Key key,
    this.child
  }) : super(key: key);

  @override
  _SABTState createState() => _SABTState();
}

class _SABTState extends State<SABT> {
  ScrollPosition position;
  bool visible;

  @override
  void dispose() {
    super.dispose();
    removeListener();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    removeListener();
    addListener();
  }

  void addListener(){
    position = Scrollable.of(context)?.position;
    position?.addListener(positionListener);
    positionListener();
  }

  void positionListener(){
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType(aspect: FlexibleSpaceBarSettings);
    bool vis = settings == null || settings.currentExtent <= settings.minExtent;
    if (visible != vis){
      setState(() => visible = vis);
    }
  }

  void removeListener(){
    position?.removeListener(positionListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: visible ? 1.0 : 0.0,
      child: widget.child,
    );
  }
}

class Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: Colors.black38,
        shape: BoxShape.circle
      ),
    );
  }
}
