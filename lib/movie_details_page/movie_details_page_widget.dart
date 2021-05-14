import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../movie_book/movie_book_widget.dart';
import '../watch/watch_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsPageWidget extends StatefulWidget {
  MovieDetailsPageWidget(
      {Key key,
      this.detailText,
      this.trailerVideo,
      this.watch,
      this.linkforBook})
      : super(key: key);

  final MoviesRecord detailText;
  final String trailerVideo;
  final String watch;
  final String linkforBook;

  @override
  _MovieDetailsPageWidgetState createState() => _MovieDetailsPageWidgetState();
}

class _MovieDetailsPageWidgetState extends State<MovieDetailsPageWidget> {
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
              padding: EdgeInsets.fromLTRB(0, 1, 0, 12),
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 123, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieBookWidget(
                        linkForBook: widget.linkforBook,
                      ),
                    ),
                  );
                },
                text: 'Read ',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 23, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WatchWidget(
                        watchContent: widget.watch,
                      ),
                    ),
                  );
                },
                text: 'Watch',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
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
      ),
    );
  }
}
