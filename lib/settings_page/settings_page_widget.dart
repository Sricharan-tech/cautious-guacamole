import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPageWidget extends StatefulWidget {
  SettingsPageWidget({Key key}) : super(key: key);

  @override
  _SettingsPageWidgetState createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 150, 1, 0),
              child: Text(
                'Settings',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        child: Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            currentUserPhoto,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(1, 0, 122, 0),
                        child: Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        border: Border.all(
                          color: Color(0xFFD6D6D6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(122, 1, 150, 112222),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                    icon: Icon(
                      Icons.wb_sunny,
                      color: Colors.black,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 1, 0, 1),
                    child: IconButton(
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                      icon: Icon(
                        Icons.nights_stay,
                        color: Colors.black,
                        size: 30,
                      ),
                      iconSize: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
