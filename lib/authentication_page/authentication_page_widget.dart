import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPageWidget extends StatefulWidget {
  AuthenticationPageWidget({Key key}) : super(key: key);

  @override
  _AuthenticationPageWidgetState createState() =>
      _AuthenticationPageWidgetState();
}

class _AuthenticationPageWidgetState extends State<AuthenticationPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.primaryColor,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -3.29),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Container(
                        width: 285,
                        height: 40,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: emailTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Email address',
                                  hintStyle: FlutterFlowTheme.title2.override(
                                    fontFamily: 'Playfair Display',
                                    color: Color(0xCB000000),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.secondaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.secondaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Playfair Display',
                                  color: Color(0xCB000000),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.95, 0.5),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Container(
                        width: 285,
                        height: 40,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: passwordTextController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: FlutterFlowTheme.title2.override(
                                    fontFamily: 'Playfair Display',
                                    color: Color(0xCB000000),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.secondaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.secondaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Playfair Display',
                                  color: Color(0xCB000000),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.95, 0.5),
                              child: Icon(
                                Icons.lock_open,
                                color: Colors.black,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              final user = await createAccountWithEmail(
                                context,
                                emailTextController.text,
                                passwordTextController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              final email = '';
                              final uid = '';

                              final usersRecordData = createUsersRecordData(
                                email: email,
                                uid: uid,
                              );

                              await UsersRecord.collection
                                  .doc(user.uid)
                                  .update(usersRecordData);

                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavBarPage(
                                      initialPage: 'AmbulantPatients'),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Sign up',
                            options: FFButtonOptions(
                              width: 125,
                              height: 40,
                              color: Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.subtitle1.override(
                                fontFamily: 'Lato',
                                color: Color(0xCB000000),
                              ),
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.secondaryColor,
                                width: 2,
                              ),
                              borderRadius: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final user = await signInWithEmail(
                                  context,
                                  emailTextController.text,
                                  passwordTextController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavBarPage(
                                        initialPage: 'AmbulantPatients'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Sign in',
                              options: FFButtonOptions(
                                width: 125,
                                height: 40,
                                color: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Lato',
                                  color: Color(0xCB000000),
                                ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.secondaryColor,
                                  width: 2,
                                ),
                                borderRadius: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lato',
                        color: Color(0xCB000000),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
