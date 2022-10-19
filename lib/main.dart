import 'package:flutter/material.dart';
import 'package:headerwidgetfinal/profile_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'widgets/header_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color _primaryColor= HexColor('##C280E4');
    Color _accentColor= HexColor('#F36EAF');
    return MaterialApp(       //#DB85F3 , #E26EF3 , #D070EB , #ED7DBD ,F36EAF , #C280E4
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),

      home: ProfilePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //to control the app colors

  // Color _primaryColor = HexColor('#DC54FE');
  // Color _accentColor = HexColor('#8A02AE');

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  double _headerHeight = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:

     Container(
        height: _headerHeight,
        child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget

    )
    );
  }
}
