import '../add_patient/add_patient_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../user/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NeurologyPatientsWidget extends StatefulWidget {
  NeurologyPatientsWidget({Key key}) : super(key: key);

  @override
  _NeurologyPatientsWidgetState createState() =>
      _NeurologyPatientsWidgetState();
}

class _NeurologyPatientsWidgetState extends State<NeurologyPatientsWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPatientWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.secondaryColor,
        elevation: 8,
        child: FaIcon(
          FontAwesomeIcons.userPlus,
          color: FlutterFlowTheme.tertiaryColor,
          size: 28,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.primaryColor,
          border: Border.all(
            color: Color(0xFFDBE2E7),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment(0, 1),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserWidget(),
                            ),
                          );
                        },
                        child: FaIcon(
                          FontAwesomeIcons.userMd,
                          color: Color(0xCB000000),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Text(
                      'U13 - Neurologie',
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Playfair Display',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPatientWidget(),
                          ),
                        );
                      },
                      child: FaIcon(
                        FontAwesomeIcons.plusCircle,
                        color: Color(0xCB000000),
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 5, 12, 8),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Icon(
                          Icons.person_search,
                          color: Color(0xFF038561),
                          size: 24,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Chercher patient...',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Color(0xFF82878C),
                              ),
                              hintText: 'Nom du patient, ipp, ...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lato',
                                color: Color(0xFF95A1AC),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x004B39EF),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x004B39EF),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF151B1E),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.tune_rounded,
                        color: Color(0xFF95A1AC),
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
