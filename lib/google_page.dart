import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_login/Login_page.dart';
import 'package:google_fonts/google_fonts.dart';


class googlePage extends StatefulWidget {
  googlePage({Key? key}) : super(key: key);

  @override
  State<googlePage> createState() => _googlePageState();
}

class _googlePageState extends State<googlePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Login"),
      ),
      body: Container(
        child: _isLoggedIn
            ? Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('Welcome! ${_userObj.displayName!}',
                style: GoogleFonts.raleway(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),),
              SizedBox(height: 40,),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(_userObj.photoUrl!),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text(_userObj.displayName!,
                style: GoogleFonts.raleway(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),),
              Text(_userObj.email,
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
              const SizedBox(height: 40,),
              SizedBox(
                width: 160,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _googleSignIn.signOut().then((value) {
                      setState(() {
                        _isLoggedIn = false;
                      });
                    }).catchError((e) {});
                    Navigator.push(context,new MaterialPageRoute(builder: (context)=>HomePage()));

                  },
                  child:Text('Logout',
                    style: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              )
            ],
          ),
        ) : Center(

            child: Column(
              children: [
                Image.asset("assets/googleBack2.png",
                  width: 410,),
                SizedBox(height:20,),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _googleSignIn.signIn().then((userData) {
                        setState(() {
                          _isLoggedIn = true;
                          _userObj = userData!;
                        });
                      }).catchError((e) {
                        print(e);
                      });
                    },

                    child: const Text('Continue with Google',style: TextStyle(
                      fontSize: 22,
                    ),),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}