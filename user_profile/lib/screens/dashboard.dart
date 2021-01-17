import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(

      ),
      endDrawer: ClipPath(
        clipper: _DrawerClipper(),
        child: Column(
          children: <Widget>[
            Text('Profile'),
            Text("Notifications"),
          ],
        ),
      ),
    );
  }
}

class _DrawerClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path = Path();
    path.moveTo(50,0);
    path.quadraticBezierTo(0, size.height/2, 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path>oldClipper) => true;
}