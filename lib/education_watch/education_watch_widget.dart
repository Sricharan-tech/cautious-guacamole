import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationWatchWidget extends StatefulWidget {
  EducationWatchWidget({Key key, this.watchContent}) : super(key: key);

  final String watchContent;

  @override
  _EducationWatchWidgetState createState() => _EducationWatchWidgetState();
}

class _EducationWatchWidgetState extends State<EducationWatchWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 190, 0, 0),
          child: FlutterFlowVideoPlayer(
            path: widget.watchContent,
            videoType: VideoType.network,
            autoPlay: false,
            looping: true,
            showControls: true,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: false,
          ),
        ),
      ),
    );
  }
}
