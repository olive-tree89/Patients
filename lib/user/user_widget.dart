import '../auth/auth_util.dart';
import '../authentication_page/authentication_page_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserWidget extends StatefulWidget {
  UserWidget({Key key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Image.asset(
                                  'assets/images/Myapp.jpg',
                                  width: MediaQuery.of(context).size.width,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.85, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/UI_avatar@2x.png',
                                    ),
                                  ),
                                ),
                              ),
                              StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    currentUserReference),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  final userNameUsersRecord = snapshot.data;
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(24, 140, 0, 0),
                                    child: Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.title2.override(
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment(-1, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(24, 174, 0, 0),
                                  child: Text(
                                    currentUserEmail,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 0, 12),
                    child: Text(
                      'Account Settings',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                              child: Text(
                                'Settings',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment(0.9, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.cogs,
                                  color: Color(0xFF038561),
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                              child: Text(
                                'Change Password',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment(0.9, 0),
                                child: InkWell(
                                  onTap: () async {
                                    final usersRecordData =
                                        createUsersRecordData();

                                    await currentUserReference
                                        .update(usersRecordData);
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.key,
                                    color: Color(0xFF038561),
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await signOut();
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthenticationPageWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Log Out',
                        options: FFButtonOptions(
                          width: 90,
                          height: 40,
                          color: Color(0xFF038561),
                          textStyle: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
