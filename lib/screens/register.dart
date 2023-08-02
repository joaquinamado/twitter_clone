import 'package:flutter/material.dart';
import '../screens/feed.dart';
import '../services/auth.dart';

class Register extends StatefulWidget {
    const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

    bool passState = false;
    final _passController = TextEditingController();
    @override
    void initState() {
        passState = false;
        super.initState();
    }
    final AuthService _authService = AuthService();
    String email = '';
    String password = '';
    String date = '';
    String name = '';

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
                    insertName(),
                    insertDate(),
                    insertMail(),
                    insertPassword(),
                    const Spacer(),
                    Align( 
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row( 
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [ 
                                    ElevatedButton(
                                        onPressed: () async => {
                                            if ( email == '' || password == '' || date == '' || name == '')
                                                const Text('Complete all data')
                                            else{
                                                _authService.signUp(email, password, name, date),
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Feed( feedUpdate: FeedUpdate(twitts: []),)) 
                                                ),
                                            }
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

    Widget insertName() {
        return Container( 
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField( 
                onChanged: (value) => setState(() {
                    name = value;
                }),
                style: const TextStyle(color: Colors.white,),
                decoration: const InputDecoration( 
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.grey),
                ),
            ),
        );
    }

    Widget insertDate() {
        return Container( 
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField( 
                onChanged: (value) => setState(() {
                    date = value;
                }),
                style: const TextStyle(color: Colors.white,),
                decoration: const InputDecoration( 
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Date of birth',
                    hintStyle: TextStyle(color: Colors.grey),
                ),
            ),
        );
    }
    Widget insertMail() {
        return Container( 
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField( 
                onChanged: (value) => setState(() {
                    email = value;
                }),
                style: const TextStyle(color: Colors.white,),
                decoration: const InputDecoration( 
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Email address',
                    hintStyle: TextStyle(color: Colors.grey),
                ),
            ),
        );
    }
    Widget insertPassword() {
        return Container( 
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField( 
                    style: const TextStyle(color: Colors.white,),
                    obscureText: !passState,
                    controller: _passController,
                    onChanged: (value) => setState(() {
                        password = value;
                    }),
                    decoration: InputDecoration( 
                        contentPadding: const EdgeInsets.all(0),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                            icon: Icon( 
                                passState? Icons.visibility: Icons.visibility_off,   
                            ),
                            iconSize: 20,
                            onPressed: () {
                                setState(() {
                                    passState = !passState;
                                });
                            },
                        ),
                    ),
                )
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

