import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:patients/authentication_page/authentication_page_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'policlinic_patients/policlinic_patients_widget.dart';
import 'neurology_patients/neurology_patients_widget.dart';
import 'stroke_patients/stroke_patients_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<PatientsFirebaseUser> userStream;
  PatientsFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = patientsFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patients',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4b39ef)),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : AuthenticationPageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'PoliclinicPatients';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'PoliclinicPatients': PoliclinicPatientsWidget(),
      'NeurologyPatients': NeurologyPatientsWidget(),
      'StrokePatients': StrokePatientsWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airport_shuttle,
              size: 24,
            ),
            label: 'Urgences',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder_shared_sharp,
              size: 24,
            ),
            label: 'U13',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder_shared,
              size: 25,
            ),
            label: 'U15',
          )
        ],
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF038561),
        unselectedItemColor: Color(0x9A038561),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
