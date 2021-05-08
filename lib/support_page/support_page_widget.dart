import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportPageWidget extends StatefulWidget {
  SupportPageWidget({Key key}) : super(key: key);

  @override
  _SupportPageWidgetState createState() => _SupportPageWidgetState();
}

class _SupportPageWidgetState extends State<SupportPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 150, 1, 0),
          child: Text(
            'Home',
            style: FlutterFlowTheme.title1.override(
              fontFamily: 'Poppins',
              fontSize: 45,
            ),
          ),
        ),
      ),
    );
  }
}
