import '../backend/backend.dart';
import '../education_details_page/education_details_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationPageWidget extends StatefulWidget {
  EducationPageWidget({Key key}) : super(key: key);

  @override
  _EducationPageWidgetState createState() => _EducationPageWidgetState();
}

class _EducationPageWidgetState extends State<EducationPageWidget> {
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
                'Education',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<EducationRecord>>(
                stream: queryEducationRecord(
                  queryBuilder: (educationRecord) =>
                      educationRecord.orderBy('Image'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<EducationRecord> gridViewEducationRecordList =
                      snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    gridViewEducationRecordList =
                        createDummyEducationRecord(count: 4);
                  }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 150,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: gridViewEducationRecordList.length,
                    itemBuilder: (context, gridViewIndex) {
                      final gridViewEducationRecord =
                          gridViewEducationRecordList[gridViewIndex];
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 23,
                        child: StreamBuilder<List<EducationRecord>>(
                          stream: queryEducationRecord(
                            queryBuilder: (educationRecord) =>
                                educationRecord.orderBy('Image'),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            List<EducationRecord> imageEducationRecordList =
                                snapshot.data;
                            // Customize what your widget looks like with no query results.
                            if (snapshot.data.isEmpty) {
                              // return Container();
                              // For now, we'll just include some dummy data.
                              imageEducationRecordList =
                                  createDummyEducationRecord(count: 1);
                            }
                            final imageEducationRecord =
                                imageEducationRecordList.first;
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EducationDetailsPageWidget(
                                      detailText:
                                          gridViewEducationRecord.detailsText,
                                      trailerVideo:
                                          gridViewEducationRecord.trailerVideo,
                                      linkForBook:
                                          gridViewEducationRecord.linkForBook,
                                      watch: gridViewEducationRecord.watch,
                                    ),
                                  ),
                                );
                              },
                              child: Image.network(
                                imageEducationRecord.image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
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
