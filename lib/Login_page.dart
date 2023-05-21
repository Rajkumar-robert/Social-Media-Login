import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_login/google_page.dart';

import 'fb_Page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Social-Auth",
              style: GoogleFonts.raleway(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),),
          ),
        ),
        body: Column(
              children: [
                SizedBox(height: 25,),
                Text("Welcome to Social-Auth!",
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),),

                Image.asset("assets/social_tree.png"),

                ElevatedButton(onPressed: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder:(context) => new googlePage()));
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                    ),
                    child: Container(
                      width: 240,
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset("assets/google.png",
                              width:45,
                              height:45,),
                            Text("Login with Google",
                            style: TextStyle(
                              fontSize: 20,
                            ),),

                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder:(context) => new fbPage()));
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                    ),
                    child: Container(
                      width: 240,
                      child: Row(
                        children: [
                          Image.asset("assets/facebook.png",
                            width:45,
                            height:45,),
                          Text("Login with Facebook",
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                        ],
                      ),
                    )),
              ],
            )
      ),
    );
  }
}
