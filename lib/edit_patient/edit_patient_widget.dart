import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPatientWidget extends StatefulWidget {
  EditPatientWidget({Key key}) : super(key: key);

  @override
  _EditPatientWidgetState createState() => _EditPatientWidgetState();
}

class _EditPatientWidgetState extends State<EditPatientWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
                border: Border.all(
                  color: Color(0xFFDBE2E7),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.tertiaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Color(0xFFE388E3),
                              size: 50,
                            ),
                          ),
                        ),
                        Text(
                          'Age',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lato',
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(
                            'Surname',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Playfair Display',
                            ),
                          ),
                        ),
                        Text(
                          'Name',
                          style: FlutterFlowTheme.title2.override(
                            fontFamily: 'Playfair Display',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            '123456',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
