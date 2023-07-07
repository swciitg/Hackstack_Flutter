import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
      Container(
        height: 500,
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/Lynn.png'),
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
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: IconButton(onPressed: ()=>{
                Navigator.of(context).pop()
              }, icon: Icon(Icons.arrow_back,color: Color(0xFFfd5564),),style: IconButton.styleFrom(backgroundColor:Color(0xFFfabfc9)),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 420, 0, 0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle,size: 7,color: Color(0xFFfd5564)),
                  SizedBox(width: 9),
                  Icon(Icons.circle,size: 7,color: Colors.white),
                  SizedBox(width: 9),
                  Icon(Icons.circle,size: 7,color: Colors.white),
                  SizedBox(width: 9),
                  Icon(Icons.circle,size: 7,color: Colors.white),
                  SizedBox(width: 9),
                  Icon(Icons.circle,size: 7,color: Colors.white),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 445, 0, 0),
              child: ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(40)
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 40, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Text('Lynn Ann , 22',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Nunito',fontStyle: FontStyle.normal),),
                                    Text('Influencer',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Nunito'),),
                              ],
                            ),
                            ClipRRect(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical:12.0,horizontal: 12.0),
                                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(100.0),color: Color(0xFFfd5564)),
                                  child: Icon(Icons.message,color: Colors.white)),)
                          ],
                        ),
                            SizedBox(height: 10),
                            Text('About',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Nunito',fontStyle: FontStyle.normal),),
                            Text('If you give me a right swipe I’ll cook you dinner.',style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'Nunito'),),
                            SizedBox(height: 10),
                            Text('Interests',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Nunito',fontStyle: FontStyle.normal),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(onPressed: ()=>{},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:6,vertical: 3),
                                  child: Text('👗Fashion',style: TextStyle(color: Colors.white),),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFfd546c),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Color(0xFFfd546c),width: 2)
                                    )
                                )
                        ),
                        TextButton(onPressed: ()=>{},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:6,vertical: 3),
                              child: Text('🎵Music',style: TextStyle(color: Colors.white),),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFfd546c),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Color(0xFFfd546c),width: 2)
                                )
                            )
                        ),
                        TextButton(onPressed: ()=>{},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:6,vertical: 3),
                              child: Text('🎨Paining',style: TextStyle(color: Colors.white),),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(onPressed: ()=>{},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:6,vertical: 3),
                                  child: Text('🍔Food & Drink',style: TextStyle(color: Colors.white),),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFfd546c),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Color(0xFFfd546c),width: 2)
                                    )
                                )
                            ),
                        TextButton(onPressed: ()=>{},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:6,vertical: 3),
                              child: Text('🏞Travel & Places',style: TextStyle(color: Colors.white),),
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
                      ],
                    ),
                  )
                )
              ),
            )
    ]
    ),

    );
  }
}
