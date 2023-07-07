import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked = false;
  String _email='',_password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: Column(
          children: [
            Image.asset('assets/front.png'),
            SizedBox(height: 10),
            Text('Create an Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Nunito',fontStyle: FontStyle.normal),),
            SizedBox(height: 20),
            Align(alignment: Alignment(-0.9,0.0),child: Text('Email',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xFFfd546c))
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Email',
              ),
              onChanged: (value){setState(() {
                _email = value.trim();
              });
              },
            ),
          SizedBox(height: 20,),
          Align(alignment: Alignment(-0.9,0.0),child: Text('Password',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFfd546c))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: 'Password',
                ),
                onChanged: (value){setState(() {
                  _password = value.trim();
                });
                },
            ),

            Row(
              children: [
              Checkbox(
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              activeColor: Color(0xFFfd546c),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
                Text('Remember me?',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          TextButton(onPressed: (){
            final credential = FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password) ;
          },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:120,vertical: 6),
                child: Text('Sign up',style: TextStyle(color: Colors.white),),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFfd546c),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Color(0xFFfd546c),width: 2)
                  )
              )
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(onPressed: ()=>{Navigator.pushNamed(context, '/login')}, child: Text('Sign in',style: TextStyle(color:Color(0xFFfd546c) ),))
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
