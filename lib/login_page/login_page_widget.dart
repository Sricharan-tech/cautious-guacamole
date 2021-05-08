import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.65),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 260),
                child: Image.asset(
                  'assets/images/unnamed.jpg',
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 230, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 60, 0, 60),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
                                child: Container(
                                  width: 230,
                                  height: 44,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 2, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final user =
                                                  await signInWithGoogle(
                                                      context);
                                              if (user == null) {
                                                return;
                                              }
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavBarPage(
                                                          initialPage:
                                                              'HomePage'),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                            text: 'Sign in with Google',
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.transparent,
                                              size: 20,
                                            ),
                                            options: FFButtonOptions(
                                              width: 230,
                                              height: 44,
                                              color: Colors.white,
                                              textStyle: GoogleFonts.getFont(
                                                'Roboto',
                                                color: Color(0xFF606060),
                                                fontSize: 17,
                                              ),
                                              elevation: 4,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                              borderRadius: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.83, 0),
                                        child: Container(
                                          width: 22,
                                          height: 22,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 23, 0, 0),
                              child: Text(
                                'By Signing in, you approve our ',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 2, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(
                                            'https://eductationaries.app/privacy-policy');
                                      },
                                      text: 'Privacy Policy',
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 20,
                                        color: Color(0xFFEEEEEE),
                                        textStyle:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 9,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'and',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await launchURL(
                                            'https://eductationaries.app/privacy-policy');
                                      },
                                      text: 'Terms & Conditions',
                                      options: FFButtonOptions(
                                        width: 150,
                                        height: 20,
                                        color: Color(0xFFEEEEEE),
                                        textStyle:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 9,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
