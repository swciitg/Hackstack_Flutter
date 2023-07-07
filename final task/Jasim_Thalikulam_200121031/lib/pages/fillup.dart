import"dart:io";
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_android/image_picker_android.dart';
class Fillup extends StatefulWidget {
  const Fillup({super.key});

  @override
  State<Fillup> createState() => _FillupState();
}

class _FillupState extends State<Fillup> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerLocation = TextEditingController();
  final storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final picker = ImagePicker();
  List<File> _image = [];
  var i = 1;
  var selectedValue = 'male';
  @override
  void dispose()
  {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerGender.dispose();
    controllerPhone.dispose();
    controllerLocation.dispose();
  }
  Future Continue() async {
    addUserDetails(
      controllerName.text.trim(),controllerEmail.text.trim(),controllerGender.text.trim(),controllerPhone.text.trim(),controllerLocation.text.trim(),
    );
  }
  Future addUserDetails(String name ,String email,String phone,String gender,String location)async{
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'location': location,

    });
  }
  getGender(){
    return controllerGender.text;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 30),
        child: Column(
          children: [
            Stack(
              alignment: Alignment(1.0,1.0),
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage('assets/Aysha.png'),
                    radius: 60,
                    backgroundColor: Colors.white,
                  ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(backgroundColor: Color(0xFFfd546c),radius: 18),
                ),
                IconButton(onPressed: (){
                  chooseImage();
                }, icon: Icon(Icons.edit),color: Colors.white,),
              ],
            ),
            SizedBox(height: 18),
            Align(alignment: Alignment(-0.9,0.0),child: Text('Full Name',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: controllerName,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFfd546c))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: 'Full Name',
                ),
              ),
            ),
              SizedBox(height: 18),
              Align(alignment: Alignment(-0.9,0.0),child: Text('Phone Number',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: controllerPhone,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFfd546c))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: 'Phone Number',
                ),
              ),
            ),SizedBox(height: 18),
            Align(alignment: Alignment(-0.9,0.0),child: Text('Email',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFfd546c))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 18),
            Align(alignment: Alignment(-0.9,0.0),child: Text('Gender',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: controllerGender,
                decoration: InputDecoration(
                  suffixIcon: DropdownButtonFormField(
                    decoration: InputDecoration.collapsed(hintText: ''),
                    padding: EdgeInsets.fromLTRB(20, 10, 20,0),
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['male','female'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFfd546c))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                 hintText: 'Gender',
                ),
              ),
            ),SizedBox(height: 18),
            Align(alignment: Alignment(-0.9,0.0),child: Text('Location',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito',fontWeight: FontWeight.bold))),
            SizedBox(height: 10,),
            SizedBox(
              height: 42,
              child: TextFormField(
                controller: controllerLocation,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.location_pin),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFFfd546c))
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: 'Location',
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(onPressed: (){
              Continue();
              Navigator.pushNamed(context, '/');
            },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:120,vertical: 6),
                  child: Text('Continue',style: TextStyle(color: Colors.white),),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFfd546c),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Color(0xFFfd546c),width: 2)
                    )
                )
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
  chooseImage()
  async{
    final pickedFile = await picker.pickImage(source:ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }
}
