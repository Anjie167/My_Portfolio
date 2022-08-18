import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/screens/home/home_screen.dart';
import 'package:flutter_profile/screens/main/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

void main() async{
  try{
    WidgetsFlutterBinding.ensureInitialized();
    if(kIsWeb){
      await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCzR_YNOKUpSyyPdt48bjfX6JVI3RPwewY",
            authDomain: "my-portfolio-1cd7a.firebaseapp.com",
            projectId: "my-portfolio-1cd7a",
            storageBucket: "my-portfolio-1cd7a.appspot.com",
            messagingSenderId: "637218110927",
            appId: "1:637218110927:web:137bc781fcd739702566ba"        )
      );
    }else{
      await Firebase.initializeApp();
    }
  }catch(e){

  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // we are using dark theme and we modify it as our need
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText1: TextStyle(color: bodyTextColor),
              bodyText2: TextStyle(color: bodyTextColor),
            ),
      ),
      home: HomeScreen(),
    );
  }
}
