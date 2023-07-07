import 'package:flutter/material.dart';
import 'package:ishq/pages/all_matches.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatefulWidget {

  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
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
      return 'Sara';
    else
    if(_gender == 'female')
      return 'Rahul';
  }
  getName()
  {
    checkGender();
    if(_gender == 'male')
      return 'Sara';
    else
      return 'Rahul';
  }
  getJob()
  {
    checkGender();
    if(_gender == 'male')
      return 'Sara';
    else
      return 'Rahul';
  }
  getAge()
  {
    checkGender();
    if(_gender == 'male')
      return '24';
    else
      return '32';
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Padding(
            padding:  EdgeInsets.fromLTRB(0, 30, 10, 0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset('assets/logo.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20.0,),
                Text('Ishq App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(width: 150.0,),
                IconButton(onPressed: ()=>{}, icon: Icon(Icons.menu_rounded,color: Color(0xFFfd5564),),style: IconButton.styleFrom(backgroundColor:Color(0xFFfabfc9)),)
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(future : checkGender(),builder: (context,snapshot){
        return Stack(
        children:
        [
          Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 35, 30, 0),
              child: Container(
                height: 500,
                child: Center(
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(20.0),
                    child: Stack(
                        children:[
                        Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/'+getName()+'.png'),
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

                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 400, 30,10),
                            child: Container(
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children :
                              [Text(getName(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                            Icon(Icons.more_vert_rounded,color: Colors.white,)]
                                    ),
                                    Text('Actress',style: TextStyle(color: Colors.white,fontSize: 20),),
                                  ],
                                )
                            ),
                          )
                    ]
                  )
                      )
                ),
              ),
            ),
          ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
            child: ElevatedButton.icon(onPressed:()=>{} ,
                label: Text('2 miles',style: TextStyle(color: Colors.black45),),
      icon:
            Icon(Icons.navigation,color: Color(0xFFfd5564),size: 20.0,),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),backgroundColor: Colors.white70 )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(338.54, 200,0, 0),
            child: ClipRRect(
              child: Stack(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical:54.0,horizontal: 12.0),
                      decoration: BoxDecoration(borderRadius:BorderRadiusDirectional.horizontal(start:Radius.circular(18.0),end: Radius.circular(.0) ),color: Color(0xFFfabfc9).withOpacity(0.3),),
                      child: Icon(Icons.person,color: Color(0xFFfd5564),size: 0.0,)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(7.5,19, 0, 0),
                    child: Column(
                      children: [
                        Icon(Icons.circle,size: 7,color: Color(0xFFfd5564)),
                        SizedBox(height:9),
                        Icon(Icons.circle,size: 7,color: Colors.white),
                        SizedBox(height:9),
                        Icon(Icons.circle,size: 7,color: Colors.white),
                        SizedBox(height:9),
                        Icon(Icons.circle,size: 7,color: Colors.white),
                        SizedBox(height:9),
                        Icon(Icons.circle,size: 7,color: Colors.white),
                      ],
                    ),
                  )
                ],
              ),),
          ),
          SizedBox(width: 10.0,),
            Padding(
              padding: EdgeInsets.fromLTRB(0,500,0,0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    ElevatedButton(onPressed:()=>{} , child: Icon(Icons.cancel_rounded,color: Color(0xFFfd5564),size: 30.0,),style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Colors.white,shadowColor: Color(0xFFfd5564),padding:EdgeInsets.all(15.0) ,elevation: 10.0)),
                    SizedBox(width: 10.0,),
                    ElevatedButton(onPressed:()=>{Navigator.pushNamed(context, '/match_found')} , child: Icon(Icons.favorite_outline_outlined,color: Color(0xFFfd5564),size: 50.0,),style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Colors.white,shadowColor: Color(0xFFfd5564),padding:EdgeInsets.all(18.0),elevation: 10.0),),
                    SizedBox(width: 10.0,),
                    ElevatedButton(onPressed:()=>{} , child: Icon(Icons.star_outline,color: Color(0xFFfd5564),size: 30.0,),style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Colors.white,shadowColor: Color(0xFFfd5564),padding:EdgeInsets.all(15.0),elevation: 10.0),),
                  ]
              ),
            )
        ],
        );
    }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ClipRRect(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical:7.0,horizontal: 12.0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFfd5564)),
                  child: Icon(Icons.home_filled,color: Colors.white)),),
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
                  padding: EdgeInsets.symmetric(vertical:0,horizontal: .0),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(9.0),color: Color(0xFFFAE7EC)),
                  child: SizedBox(height: 40,
                  child:IconButton(onPressed: ()=>{Navigator.pushNamed(context, '/all_matches')},icon:Icon(Icons.favorite,color: Color(0xFFfd5564))))),),
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
      backgroundColor: Colors.white,
    );
  }
}
