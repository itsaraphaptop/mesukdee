import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentConsWidget extends StatefulWidget {
  const ContentConsWidget({
    Key key,
    this.postis,
  }) : super(key: key);

  final DocumentReference postis;

  @override
  _ContentConsWidgetState createState() => _ContentConsWidgetState();
}

class _ContentConsWidgetState extends State<ContentConsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<JobSubConsRecord>(
      stream: JobSubConsRecord.getDocument(widget.postis),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final contentConsJobSubConsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFF1F5F8),
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFF090F13),
                size: 32,
              ),
            ),
            title: Text(
              'Jobs Details',
              style: FlutterFlowTheme.title2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF1F5F8),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        contentConsJobSubConsRecord.photoUrl,
                        width: MediaQuery.of(context).size.width,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            contentConsJobSubConsRecord.jobTitle,
                            style: FlutterFlowTheme.title2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFF1F5F8),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            dateTimeFormat(
                                'Hm', contentConsJobSubConsRecord.createdTime),
                            style: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFFD4A752),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            contentConsJobSubConsRecord.jobDesc,
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('ButtonPrimary pressed ...');
                      },
                      text: 'Reserve Jobs',
                      options: FFButtonOptions(
                        width: 300,
                        height: 60,
                        color: Color(0xFF203047),
                        textStyle: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
