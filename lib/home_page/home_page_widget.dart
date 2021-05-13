import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../home_details_page/home_details_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
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
                'Home',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<HomeRecord>>(
                stream: queryHomeRecord(
                  queryBuilder: (homeRecord) => homeRecord.orderBy('Image'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<HomeRecord> gridViewHomeRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    gridViewHomeRecordList = createDummyHomeRecord(count: 4);
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
                    itemCount: gridViewHomeRecordList.length,
                    itemBuilder: (context, gridViewIndex) {
                      final gridViewHomeRecord =
                          gridViewHomeRecordList[gridViewIndex];
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 23,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeDetailsPageWidget(
                                      detailText: gridViewHomeRecord,
                                      trailerVideo:
                                          gridViewHomeRecord.trailerVideo,
                                      watch: gridViewHomeRecord.watch,
                                    ),
                                  ),
                                );
                              },
                              child: Image.network(
                                gridViewHomeRecord.image,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
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
