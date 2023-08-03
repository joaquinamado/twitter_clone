import 'package:flutter/material.dart';
import 'package:twitter_clone/services/auth.dart';
import '../screens/feed.dart';

class EnterPassword extends StatefulWidget {
    final String email;
    const EnterPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
    bool passState = false;
    String password = '';
    final _passController = TextEditingController();
    final AuthService _authService = AuthService();

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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField( 
                                style: const TextStyle(color: Colors.white,),
                                obscureText: !passState,
                                controller: _passController,
                                onChanged: (value) {
                                    password = value;
                                },
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
                                    contentPadding: const EdgeInsets.all(0),
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(color: Colors.grey),
                                ),
                            )
                    ),

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
                                        onPressed: () async {
                                            if (password != '') {
                                                _authService.signIn(widget.email, password);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const Feed()) 
                                                );
                                            }
                                            else {
                                                const Text('Insert Password');
                                            }
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                        child: const Text("Log In", style: TextStyle(color: Colors.white),)
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
                    icon: const Icon(
                        Icons.close,
                        color: Colors.blue,
                        size: 30,
                    ),
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
