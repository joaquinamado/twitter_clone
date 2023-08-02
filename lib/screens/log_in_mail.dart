import 'package:flutter/material.dart';
import '../screens/log_in_pass.dart';

class HomeLogIn extends StatelessWidget {
    HomeLogIn({Key? key}) : super(key: key);
    
    String email = '';
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
                            padding: const EdgeInsets.all(15.0),
                            child: Row( 
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [ 
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("Forgot password?", style: TextStyle(color: Colors.blue),),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                            email != ''? Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => EnterPassword(email: email,)) 
                                            ) : const Text('Enter a email account');
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

    Widget searchBox() {
        return Container( 
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField( 
                onChanged: (value) {email = value;},
                style: const TextStyle(color: Colors.white,),
                decoration: const InputDecoration( 
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Phone, email or username',
                    hintStyle: TextStyle(color: Colors.grey),
                ),
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
                    icon: const Icon(
                        Icons.close,
                        color: Colors.blue,
                        size: 30,
                    ),
                    onPressed: () {
                        Navigator.pop(context);
                    }
                ),
                Expanded(
                  child: SizedBox( 
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
