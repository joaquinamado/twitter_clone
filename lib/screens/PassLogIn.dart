import 'package:flutter/material.dart';
import '../screens/feed.dart';

class EnterPassword extends StatefulWidget {
    EnterPassword({Key? key}) : super(key: key);

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {

    bool passState = false;
    final _passController = TextEditingController();
    @override
    void initState() {
        passState = false;
        super.initState();
    }

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
                            "Enter your password", 
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                        ),
                    ),
                        
                    Container( 
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        //child: enterPassword(),    
                        child: TextFormField( 
                                style: TextStyle(color: Colors.white,),
                                obscureText: !passState,
                                controller: _passController,
                                decoration: InputDecoration( 
                                    suffixIcon: IconButton(
                                        icon: Icon( 
                                            passState? Icons.visibility: Icons.visibility_off,   
                                        ),
                                        onPressed: () {
                                            setState(() {
                                                passState = !passState;
                                            });
                                        },
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.grey),
                                ),
                            )
                    ),

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
                                                MaterialPageRoute(builder: (context) => Feed()) 
                                            );
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                        child: Text("Log In", style: TextStyle(color: Colors.white),)
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

AppBar buildAppBar(context) {
    return AppBar( 
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
            children: [ 
                IconButton( 
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    icon: Icon(
                        Icons.close,
                        color: Colors.blue,
                        size: 30,
                    ),
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
