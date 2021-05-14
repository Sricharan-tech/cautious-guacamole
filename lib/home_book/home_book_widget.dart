import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBookWidget extends StatefulWidget {
  HomeBookWidget({Key key, this.linkforBook}) : super(key: key);

  final String linkforBook;

  @override
  _HomeBookWidgetState createState() => _HomeBookWidgetState();
}

class _HomeBookWidgetState extends State<HomeBookWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
