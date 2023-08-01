import 'package:flutter/material.dart';

class Twitt extends StatelessWidget {
    Twitt({ Key? key}) : super(key:key);

    @override
    Widget build(BuildContext context) {
        return Container( 
            padding: const EdgeInsets.all(20),
            child: Column( 
                children: [ 
                    Text('Info del twit'),
                    Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Icon(Icons.message),
                            Icon(Icons.repeat),
                            Icon(Icons.favorite)
                        ],
                    ),
                ],
            )
        );
    }
}
