import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationBookWidget extends StatefulWidget {
  EducationBookWidget({Key key, this.linkforBook}) : super(key: key);

  final String linkforBook;

  @override
  _EducationBookWidgetState createState() => _EducationBookWidgetState();
}

class _EducationBookWidgetState extends State<EducationBookWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
