import '../add_patient/add_patient_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../user/user_widget.dart';
import '../view_patient/view_patient_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StrokePatientsWidget extends StatefulWidget {
  StrokePatientsWidget({Key key}) : super(key: key);

  @override
  _StrokePatientsWidgetState createState() => _StrokePatientsWidgetState();
}

class _StrokePatientsWidgetState extends State<StrokePatientsWidget> {
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
                          'U15 - Stroke',
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
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF82878C),
                                  ),
                                  hintText: 'Nom du patient, ipp, ...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
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
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: StreamBuilder<List<PatientRecord>>(
              stream: queryPatientRecord(
                queryBuilder: (patientRecord) => patientRecord
                    .where('p_where', isEqualTo: 'Stroke')
                    .orderBy('p_addDate'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<PatientRecord> listViewPatientRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  listViewPatientRecordList =
                      createDummyPatientRecord(count: 4);
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewPatientRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewPatientRecord =
                        listViewPatientRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFF76A9AD),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xCA91D0D9),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 5, 10, 1),
                                child: FaIcon(
                                  FontAwesomeIcons.mars,
                                  size: 100,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nom',
                                      style: FlutterFlowTheme.title2.override(
                                        fontFamily: 'Playfair Display',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Prénom',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Playfair Display',
                                      ),
                                    ),
                                    Text(
                                      'IPP',
                                      style:
                                          FlutterFlowTheme.subtitle1.override(
                                        fontFamily: 'Lato',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ViewPatientWidget(),
                                      ),
                                    );
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.addressBook,
                                    color: Color(0xFF038561),
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
