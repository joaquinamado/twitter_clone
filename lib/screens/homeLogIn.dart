import 'package:flutter/material.dart';
import '../screens/PassLogIn.dart';

class HomeLogIn extends StatelessWidget {
    HomeLogIn({Key? key}) : super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold( 
            backgroundColor: Colors.black,
            appBar: buildAppBar(context),
            body: Column( 
                children: [ 
                    Container( 
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: const Text(
                            "To get started, first enter your phone, email or @username", 
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                        ),
                    ),
                    searchBox(),
                    const Spacer(),
                    Align( 
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row( 
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [ 
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Forgot password?", style: TextStyle(color: Colors.blue),),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => EnterPassword()) 
                                            );
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                        child: Text("Next", style: TextStyle(color: Colors.white),)
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
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
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

Widget searchBox() {
    return Container( 
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField( 
            onChanged: (value) {},
            style: TextStyle(color: Colors.white,),
            decoration: InputDecoration( 
                contentPadding: EdgeInsets.all(0),
                hintText: 'Phone, email or username',
                hintStyle: TextStyle(color: Colors.grey),
            ),
        ),
    );
}
