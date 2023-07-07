import 'package:flutter/material.dart';
class MatchFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/match.png'),
            Text('Dont keep them waiting , say hello now!',style: TextStyle(fontSize: 18,fontFamily: 'Nunito',color: Colors.grey[800]),),
            SizedBox(height: 10,),
            TextButton(onPressed: ()=>{
              Navigator.pushNamed(context, '/all_matches')
            },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:100,vertical: 6),
                  child: Text('Say Hello',style: TextStyle(color: Colors.white),),
                ),
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFfd546c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Color(0xFFfd546c),width: 2)
                )
            )
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: ()=>{
              Navigator.of(context).pop()
            },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:90,vertical: 6),
                  child: Text('Keep Swiping',style: TextStyle(color: Color(0xFFfd546c)),
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Color(0xFFfd546c),width: 2),
                  )
                )
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

