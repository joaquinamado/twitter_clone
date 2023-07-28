import 'package:flutter/material.dart';
import '../screens/PassLogIn.dart';

class Register extends StatelessWidget {
    Register({Key? key}) : super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold( 
            backgroundColor: Colors.black,
            appBar: buildAppBar(context),
            body: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                    const Text(
                        "Create your account", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                    ),
                    searchBox('Name'),
                    searchBox('Phone number or email address'),
                    searchBox('Date of birth'),
                    const Spacer(),
                    Align( 
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row( 
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [ 
                                    ElevatedButton(
                                        onPressed: () {
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                        child: const Text("Next", style: TextStyle(color: Colors.white),)
                                    ),
                                ],
                            )
                        ),
                    )
                ],
            ),
        );
    }
}

AppBar buildAppBar(BuildContext context) {
    return AppBar( 
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
            children: [ 
                IconButton( 
                    icon: Icon(
                        Icons.close,
                        color: Colors.blue,
                        size: 30,
                    ),
                    onPressed: () {
                        Navigator.pop(context);
                    }
                ),
                Expanded(
                  child: Container( 
                      height: 40,
                      width: 40,
                      child : ClipRRect( 
                          child: Image.asset('pictures/twitter_icon.png'),
                      ),
                  ),
                ),
            ],
        ),
    );
}

Widget searchBox(String hinttext) {
    return Container( 
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField( 
            onChanged: (value) {},
            style: TextStyle(color: Colors.white,),
            decoration: InputDecoration( 
                contentPadding: EdgeInsets.all(0),
                hintText: hinttext,
                hintStyle: TextStyle(color: Colors.grey),
            ),
        ),
    );
}
