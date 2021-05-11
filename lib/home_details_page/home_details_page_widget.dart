import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDetailsPageWidget extends StatefulWidget {
  HomeDetailsPageWidget({Key key, this.detailText, this.trailerVideo})
      : super(key: key);

  final HomeRecord detailText;
  final String trailerVideo;

  @override
  _HomeDetailsPageWidgetState createState() => _HomeDetailsPageWidgetState();
}

class _HomeDetailsPageWidgetState extends State<HomeDetailsPageWidget> {
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
              padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
              child: FlutterFlowVideoPlayer(
                path: widget.trailerVideo,
                videoType: VideoType.network,
                autoPlay: true,
                looping: true,
                showControls: false,
                allowFullScreen: false,
                allowPlaybackSpeedMenu: false,
              ),
            ),
            StreamBuilder<List<HomeRecord>>(
              stream: queryHomeRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<HomeRecord> rowHomeRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  rowHomeRecordList = createDummyHomeRecord(count: 1);
                }
                final rowHomeRecord = rowHomeRecordList.first;
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                        child: IconButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'HomePage'),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                          iconSize: 30,
                        ),
                      ),
                      StreamBuilder<List<HomeRecord>>(
                        stream: queryHomeRecord(
                          queryBuilder: (homeRecord) =>
                              homeRecord.orderBy('DetailsText'),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          List<HomeRecord> textHomeRecordList = snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            // return Container();
                            // For now, we'll just include some dummy data.
                            textHomeRecordList =
                                createDummyHomeRecord(count: 1);
                          }
                          final textHomeRecord = textHomeRecordList.first;
                          return Padding(
                            padding:
                                EdgeInsets.fromLTRB(55, 1, 82398439839898, 0),
                            child: Text(
                              widget.detailText.detailsText,
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Poppins',
                                fontSize: 32,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
