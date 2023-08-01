import 'package:flutter/material.dart';
import '../widgets/tweet.dart';

class Feed extends StatelessWidget {
    Feed({Key? key}) : super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold( 
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: Column( 
                children: [ 
                        Twitt(), 
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Icon(Icons.home),
                            Icon(Icons.search),
                            Icon(Icons.notifications),
                            Icon(Icons.mail),
                        ],
                    ),
                ],
            ),
        );
    }
}

AppBar buildAppBar() {
    return AppBar( 
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
            children: [ 
                const Icon(Icons.reorder, color: Colors.blue,),
                Expanded(
                  child: SizedBox( 
                      height: 40,
                      width: 40,
                      child : ClipRRect( 
                          child: Image.asset('pictures/twitter_icon.png'),
                      ),
                  ),
                ),

                const Icon(Icons.auto_awesome_sharp, color: Colors.blue,),
            ],
        ),
    );
}
