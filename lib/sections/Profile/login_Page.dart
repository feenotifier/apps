// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                      colors: [Colors.deepPurple.shade800,Colors.deepPurpleAccent],
                    ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   CircleAvatar(
                        radius: 65.0,
                        child: Icon( 
                          Icons.person,
                          size: 30,
                          ),//replace with image
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10.0,),
                      Text('Example name',//Name
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      )),
                ],
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)
                  )
                  ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0,
                              vertical: 6.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[300]
                            ),
                            child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1.0, color: Colors.white24))),
                              child: Icon(Icons.email,
                              color: Colors.red,),
                            ),
                            title: Text(
                              "Example@gmail.com",//Email
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                        ),
                        ),
                  ),
                  SizedBox(height: 20),
                  Card(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0,
                              vertical: 6.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[300]
                            ),
                            child:ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1.0, color: Colors.white24))),
                              child: Icon(Icons.phone,
                              color: Colors.blue,),
                            ),
                            title: Text(
                              "+91 0000000000",//Phone number
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                        ),
                        ),
                  )

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Made in India with ❤️ Fee Notifier",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.70)
                ),
              ),
            )
            ,
          )
        ],
      ),
    );
  }
}