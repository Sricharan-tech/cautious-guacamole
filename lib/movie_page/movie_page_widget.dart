import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePageWidget extends StatefulWidget {
  MoviePageWidget({Key key}) : super(key: key);

  @override
  _MoviePageWidgetState createState() => _MoviePageWidgetState();
}

class _MoviePageWidgetState extends State<MoviePageWidget> {
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
                'Movies',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment(-0.15, -0.1),
                child: StreamBuilder<List<MoviesRecord>>(
                  stream: queryMoviesRecord(
                    queryBuilder: (moviesRecord) =>
                        moviesRecord.orderBy('Images'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<MoviesRecord> gridViewMoviesRecordList = snapshot.data;
                    // Customize what your widget looks like with no query results.
                    if (snapshot.data.isEmpty) {
                      // return Container();
                      // For now, we'll just include some dummy data.
                      gridViewMoviesRecordList =
                          createDummyMoviesRecord(count: 4);
                    }
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: gridViewMoviesRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewMoviesRecord =
                              gridViewMoviesRecordList[gridViewIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            elevation: 23,
                            child: Image.network(
                              gridViewMoviesRecord.images,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
