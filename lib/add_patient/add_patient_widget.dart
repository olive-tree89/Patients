import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPatientWidget extends StatefulWidget {
  AddPatientWidget({Key key}) : super(key: key);

  @override
  _AddPatientWidgetState createState() => _AddPatientWidgetState();
}

class _AddPatientWidgetState extends State<AddPatientWidget> {
  String whereInputValue;
  TextEditingController ippInputController;
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ippInputController = TextEditingController();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    whereInputValue = 'Ambulant';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.primaryColor,
              border: Border.all(
                color: Color(0xFFDBE2E7),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(-0.6, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nouveau patient',
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Playfair Display',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.7, 0.25),
                  child: InkWell(
                    onTap: () async {
                      final pSurname = textController1.text;
                      final pName = textController2.text;
                      final pIpp = ippInputController.text;
                      final pWhere = whereInputValue;
                      final pAddDate = getCurrentTimestamp;

                      final patientRecordData = createPatientRecordData(
                        pSurname: pSurname,
                        pName: pName,
                        pIpp: pIpp,
                        pWhere: pWhere,
                        pAddDate: pAddDate,
                      );

                      await PatientRecord.collection
                          .doc()
                          .set(patientRecordData);
                      Navigator.pop(context);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.check,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Données personelles',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF0D1724),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: TextFormField(
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nom',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF8B97A2),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: TextFormField(
                                      controller: textController2,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Prénom',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF8B97A2),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: TextFormField(
                                      controller: ippInputController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'IPP',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF8B97A2),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
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
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: FlutterFlowDropDown(
                      options: ['Ambulant', 'U13 - Neurologie', 'U15 - Stroke'],
                      onChanged: (value) {
                        setState(() => whereInputValue = value);
                      },
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.05,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lato',
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 5,
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
