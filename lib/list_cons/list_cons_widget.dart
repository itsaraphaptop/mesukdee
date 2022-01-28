import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../content_cons/content_cons_widget.dart';
import '../create_jobs/create_jobs_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListConsWidget extends StatefulWidget {
  const ListConsWidget({Key key}) : super(key: key);

  @override
  _ListConsWidgetState createState() => _ListConsWidgetState();
}

class _ListConsWidgetState extends State<ListConsWidget> {
  TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F5F8),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Jobs',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFFD4A752),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if ((currentUserDocument?.rule) == 'admin')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: AuthUserStreamWidget(
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateJobsWidget(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.person,
                color: Color(0xFF090F13),
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
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
                  Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                        child: TextFormField(
                          controller: searchFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search for classes...',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Search by name, location etc...',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD4A752),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD4A752),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Color(0xFF95A1AC),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF95A1AC),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Upcoming Jobs',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF8B97A2),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<List<JobSubConsRecord>>(
                stream: queryJobSubConsRecord(
                  queryBuilder: (jobSubConsRecord) => jobSubConsRecord
                      .where('uid', isEqualTo: currentUserUid)
                      .orderBy('Created_time', descending: true),
                ),
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
                  List<JobSubConsRecord> columnClassesJobSubConsRecordList =
                      snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                          columnClassesJobSubConsRecordList.length,
                          (columnClassesIndex) {
                        final columnClassesJobSubConsRecord =
                            columnClassesJobSubConsRecordList[
                                columnClassesIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContentConsWidget(
                                    postis:
                                        columnClassesJobSubConsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFF090F13),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            columnClassesJobSubConsRecord
                                                .photoUrl,
                                            width: 100,
                                            height: 130,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF203047),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        columnClassesJobSubConsRecord
                                                            .jobTitle,
                                                        style: FlutterFlowTheme
                                                            .title2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        columnClassesJobSubConsRecord
                                                            .jobDesc
                                                            .maybeHandleOverflow(
                                                          maxChars: 10,
                                                          replacement: '…',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFFD4A752),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button-Reserve pressed ...');
                                                      },
                                                      text: 'Reserve',
                                                      icon: Icon(
                                                        Icons.add_rounded,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 120,
                                                        height: 40,
                                                        color:
                                                            Color(0xFFD4A752),
                                                        textStyle:
                                                            GoogleFonts.getFont(
                                                          'Lexend Deca',
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 8,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
