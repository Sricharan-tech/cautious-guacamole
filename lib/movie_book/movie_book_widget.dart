import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieBookWidget extends StatefulWidget {
  MovieBookWidget({Key key, this.linkForBook}) : super(key: key);

  final String linkForBook;

  @override
  _MovieBookWidgetState createState() => _MovieBookWidgetState();
}

class _MovieBookWidgetState extends State<MovieBookWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
