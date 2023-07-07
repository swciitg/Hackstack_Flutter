import 'package:flutter/material.dart';
import 'package:ishq/pages/home.dart';
import 'package:ishq/pages/match_found.dart';
import 'package:ishq/pages/profile.dart';
import 'package:ishq/pages/fillup.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_android/image_picker_android.dart';

class AllMatches extends StatelessWidget {
  List<String> docID = [];
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  var _gender = '';
  Future<void> fetchData() async {
    QuerySnapshot snapshot = await usersCollection.get();
      for (QueryDocumentSnapshot document in snapshot.docs) {
        String documentId = document.id;
        Map<String, dynamic>? documentData = document.data() as Map<String, dynamic>?;

        if (documentData != null) {
          String gender = documentData['gender'];
          _gender = gender;
          print('Document ID: $documentId');
          print('Gender: $gender');
        }
      }
  }
  Future checkGender() async{
    await fetchData();
    if(_gender =='male')
      {
        name.addAll(['Sara','Naomi','Lynn','Aysha','Neha','Rachel']);
        age.addAll(['27','25','22','24','31','32']);
        prof.addAll(['Model','Yoga Instructor','Influencer','Software Engineer','HR Manager', 'Teacher']);
      }
    else
      if(_gender == 'female')
        {
          {
            name.addAll(['Ravi','George','Rahul','Noel','Faris','Abdulla']);
            age.addAll(['29','26','32','26','35','20']);
            prof.addAll(['Pilot','Circle Inspector','Musician','Finance Manager','Accountant', 'Fashion Designer']);
          }
        }
  }
 var name= [];
 var age = [];
 var prof = [];
  @override
  void initState()
  {
    checkGender();
    fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFfd5564),
        ),
        title : Padding(
          padding:  EdgeInsets.fromLTRB(0,10, 0,0),
          child: Row(
            children: [
              Text('All Match(279)',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 60.0,),
              ClipRRect(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 8.0),
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0),color: Color(0xFFFAE7EC)),
                    child: Icon(Icons.search,color: Color(0xFFfd5564))),),
              SizedBox(width: 10,),
              ClipRRect(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 8.0),
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0),color: Color(0xFFFAE7EC)),
                    child: Icon(Icons.menu_rounded,color: Color(0xFFfd5564))),),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
      Center(
        child: FutureBuilder(future : checkGender(),builder: (context,snapshot){
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: 6,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                  onTap: ()=>{
                    Navigator.pushNamed(context, '/profile')
                  },
                  child: Card(
                      elevation: 0,
                      child: ClipRRect(
                          borderRadius:BorderRadius.circular(30.0),
                          child: Stack(
                              children:[
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/${name[i]}.png'),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child:Container(
                                    decoration:
                                    BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.center,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Color(0xFFfd5564),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(25, 144, 10, 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children :
                                              [Text('${name[i]},${age[i]}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),]
                                          ),
                                          Text('${prof[i]}',style: TextStyle(color: Colors.white,fontSize: 12),),
                                        ],
                                      ),
                                    )
                                ),
                              ]
                          )
                      )
                  )
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5,
              mainAxisExtent: 200,
            ),
          );
        })
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ClipRRect(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical:0,horizontal: .0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFFAE7EC)),
                  child: SizedBox(height: 40,
                      child:IconButton(onPressed: ()=>{Navigator.of(context).pop()},icon:Icon(Icons.home_filled,color: Color(0xFFfd5564))))),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical:7.0,horizontal: 12.0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFFAE7EC)),
                  child: Icon(Icons.map,color: Color(0xFFfd5564))),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical:7.0,horizontal: 12.0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFfd5564)),
                  child: Icon(Icons.favorite,color: Color(0xFFFAE7EC))),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical:7.0,horizontal: 12.0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFFAE7EC)),
                  child: Icon(Icons.message,color: Color(0xFFfd5564))),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical:0,horizontal: .0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFFAE7EC)),
                  child: SizedBox(height: 40,
                      child:IconButton(onPressed: ()=>{Navigator.pushNamed(context, '/profile')},icon:Icon(Icons.person,color: Color(0xFFfd5564))))),),
            label: '',
          ),
        ],
      ),
    );
  }
}

