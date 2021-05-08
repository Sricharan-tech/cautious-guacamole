import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PodcastPageWidget extends StatefulWidget {
  PodcastPageWidget({Key key}) : super(key: key);

  @override
  _PodcastPageWidgetState createState() => _PodcastPageWidgetState();
}

class _PodcastPageWidgetState extends State<PodcastPageWidget> {
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
              padding: EdgeInsets.fromLTRB(12, 150, 1, 0),
              child: Text(
                'Podcast',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<PodcastRecord>>(
                stream: queryPodcastRecord(
                  queryBuilder: (podcastRecord) =>
                      podcastRecord.orderBy('Audio'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<PodcastRecord> gridViewPodcastRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    gridViewPodcastRecordList =
                        createDummyPodcastRecord(count: 4);
                  }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 70,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: gridViewPodcastRecordList.length,
                    itemBuilder: (context, gridViewIndex) {
                      final gridViewPodcastRecord =
                          gridViewPodcastRecordList[gridViewIndex];
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 23,
                        child: FlutterFlowVideoPlayer(
                          path: gridViewPodcastRecord.audio,
                          videoType: VideoType.network,
                          autoPlay: false,
                          looping: true,
                          showControls: true,
                          allowFullScreen: true,
                          allowPlaybackSpeedMenu: false,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
