import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedContracterWidget extends StatefulWidget {
  const FeedContracterWidget({Key key}) : super(key: key);

  @override
  _FeedContracterWidgetState createState() => _FeedContracterWidgetState();
}

class _FeedContracterWidgetState extends State<FeedContracterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F5F8),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
        child: StreamBuilder<List<PostRecord>>(
          stream: queryPostRecord(
            queryBuilder: (postRecord) =>
                postRecord.orderBy('created_time', descending: true),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitPulse(
                    color: FlutterFlowTheme.primaryColor,
                    size: 50,
                  ),
                ),
              );
            }
            List<PostRecord> listViewPostRecordList = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewPostRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewPostRecord =
                    listViewPostRecordList[listViewIndex];
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<PostRecord>>(
                            stream: queryPostRecord(
                              queryBuilder: (postRecord) => postRecord
                                  .orderBy('created_time', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitPulse(
                                      color: FlutterFlowTheme.primaryColor,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<PostRecord> imagePostRecordList =
                                  snapshot.data;
                              return Image.network(
                                '',
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
