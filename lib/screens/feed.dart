import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
    Feed({Key? key}) : super(key: key);

    @override 
    Widget build(BuildContext context) {
        return Scaffold( 
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: const Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
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
