import 'package:flutter/material.dart';
import '../screens/PassLogIn.dart';
import '../screens/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
    Register({Key? key}) : super(key: key);

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

    FirebaseAuth auth = FirebaseAuth.instance;

    void registerAction() async {
        try {
            UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
                print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
            }
        } catch (e) {
                print(e);
         }
    }


    String email = '';
    String password = '';

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
                    searchBox('Date of birth'),
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
                                            registerAction(),
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Feed()) 
                                            ),
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

    Widget searchBox(String hinttext) {
        return Container( 
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField( 
                onChanged: (value) {},
                style: const TextStyle(color: Colors.white,),
                decoration: InputDecoration( 
                    contentPadding: const EdgeInsets.all(0),
                    hintText: hinttext,
                    hintStyle: const TextStyle(color: Colors.grey),
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

