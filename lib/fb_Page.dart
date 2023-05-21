import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_login/Login_page.dart';

class fbPage extends StatefulWidget {
  @override
  _fbPageState createState() => _fbPageState();
}

class _fbPageState extends State<fbPage> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login"),
      ),
      body: Container(
        child: _isLoggedIn
            ? Center(

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:60.0,horizontal: 0.0),
                child: Column(
          children: [
                Text('Welcome! ${_userObj["name"]}',
                  style: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),),
                SizedBox(height: 30,),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(_userObj["picture"]["data"]["url"]),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(_userObj["name"],
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),),
                SizedBox(height: 70,),
                SizedBox(
                  width: 160,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        FacebookAuth.instance.logOut().then((value) {
                          setState(() {
                            _isLoggedIn = false;
                            _userObj = {};
                          });
                        });
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder:(context) => new HomePage()));
                      },
                      child: Text("Logout",
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),)),
                )
          ],
        ),
              ),
            )
            : Center(
                child:Column(
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("assets/fbBack2.png",
                    width: 410,),
                    SizedBox(height:2,),
                    SizedBox(
                        width: 300,
                        height: 60,
                        child: ElevatedButton(

                          child: Text("Continue with Facebook",
                            style: TextStyle(
                              fontSize: 22,
                            ),),
                          onPressed: () async {
                            FacebookAuth.instance.login(
                                permissions: ["public_profile"]).then((value) {
                              FacebookAuth.instance.getUserData().then((userData) {
                                setState(() {
                                  _isLoggedIn = true;
                                  _userObj = userData;
                                });
                              });
                            });
                          },
                      ),

                    )
            ],
          )

        ),
      ),
      
    );


  }
}