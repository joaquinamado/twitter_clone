import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/log_in_mail.dart';
import 'package:twitter_clone/screens/register.dart';

class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold( 
            backgroundColor: Colors.black,
            appBar: buildAppBar(),
            body: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                    Center(
                      child: Container( 
                            padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
                            child: const Text(
                                "See what's happening in the world right now.", 
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),
                            ),
                        ),
                      ),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 300),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: SizedBox(
                                width: 300,
                                height: 40,
                                child: ClipRRect( 
                                    child: Image.asset('pictures/google_icon.png'),
                                ),
                            ),
                        ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container( 
                                padding: const EdgeInsets.only(left: 300, right: 10),
                                child: const Divider( 
                                    color: Colors.grey,
                                ),
                            ),
                        ),
                        const Text(
                            'or', 
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Expanded(
                            child: Container( 
                                padding: const EdgeInsets.only(left: 10, right: 300),
                                child: const Divider( 
                                    color: Colors.grey,
                                ),
                            ),
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 300),
                        child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Register()) 
                                );
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child:  const SizedBox(
                              width: 300,
                              height: 40,
                              child: Center(
                                child: Text(
                                    'Create account',
                                    style: TextStyle(color: Colors.white,)
                                ),
                              )
                          ), 
                      ),
                    ),
                    Center(
                      child: Row( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                              const Text(
                                "By signing up you agree to our",
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Terms Privacy Policy",
                                    style: TextStyle(color: Colors.blue, fontSize: 10),
                                  )
                              ),
                              const Text(
                                "and",
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Cookie Use.",
                                    style: TextStyle(color: Colors.blue, fontSize: 10),
                                  )
                              )
                          ],
                      ),
                    ),
                    const Spacer(), 
                    Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            const Text(
                                "Have an account already?",
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            TextButton(
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomeLogIn()) 
                                    );
                                },
                                child: const Text(
                                    "Log in",
                                    style: TextStyle(color: Colors.blue, fontSize: 10),
                                )
                            )
                        ] 
                    )
                ],
            ),
        );
    }
}

AppBar buildAppBar() {
    return AppBar( 
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
            children: [ 
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
