import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headerwidgetfinal/widgets/header_widget.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'common/theme_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'dztgYRZyOeHtmWYAD93X2QJSuMSbGuelhHVpsQ3p';
  final keyClientKey = 'H4yYM9tUlHZQ59JbYcNL33rfxSrkNf1Ll0g5Dqf1';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProfilePage(),
      )
  );
}

class ProfilePage extends StatefulWidget{

@override
State<StatefulWidget> createState() {
  return _ProfilePageState();
}
}

class _ProfilePageState extends State<ProfilePage>{
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Profile Page",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    elevation: 0.5,
    flexibleSpace:Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topLeft, //control the colores space in the app bar the purprle color
    end: Alignment.bottomRight,//control the colores space in the app bar the pink color
    colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
    )
    ),
    ),
    ),


    body:SingleChildScrollView(
        child: Stack(
          children: [
          Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),), //control the space under the app bar to be the same as the app bar

      ///// controls the profile icon
        Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
            children: [
        Container(
        padding: EdgeInsets.all(10), // control the size of the profile circle
        decoration: BoxDecoration( // control the size of the profile circle
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 5, color: Colors.white),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),), // control the shadow behind the profile circle
          ],
        ),
        child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),////control the profile icon
      ),
         SizedBox(height: 20,),

              // FutureBuilder<ParseUser?>(
              //     future: getUser(),
              //     builder: (context, snapshot) {
              //       switch (snapshot.connectionState) {
              //         case ConnectionState.none:
              //         case ConnectionState.waiting:
              //           return Center(
              //             child: Container(
              //                 width: 50,
              //                 height: 50,
              //                 child: CircularProgressIndicator()),
              //           );
              //         default:
              //           if (snapshot.hasError) {
              //             return Center(
              //               child: Text("Error..."),
              //             );
              //           }
              //           if (!snapshot.hasData) {
              //             return Center(
              //               child: Text("No Data..."),
              //             );
              //           } else {
              //             return Column(children: [
                          Form(
                         key: _formKey,
                          child: Column(
                          children: [
                          Container(
                          child: TextField(
                          decoration: ThemeHelper().textInputDecoration('password'),
                             ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                           ),
                          SizedBox(height: 30.0),
                          Container(
                             child: TextField(
                             obscureText: true,
                             decoration: ThemeHelper().textInputDecoration('usename'),
                              ),
                             decoration: ThemeHelper().inputBoxDecorationShaddow(),
                      ),
                    ]
                  ),
               ),


              //       ]
              //       );
              //
              //      }
              //     }
              //    }
              // ),
             ]
            ),
          ),
        ]
      ),
     ),
    );
  }
}

Future<ParseUser?> getUser() async {
  var currentUser = await ParseUser.currentUser() as ParseUser?;
  return currentUser;
}
