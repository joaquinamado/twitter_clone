import 'package:flutter/material.dart';

class Twitt extends StatelessWidget {
    final String data = '';
    final String username = '';
    Twitt({ Key? key, required data, required username}) : super(key:key);

    @override
    Widget build(BuildContext context) {
        return Container( 
            padding: const EdgeInsets.all(20),
            child: Column( 
                children: [ 
                    ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        title: Text(username),
                        leading: Text(data),
                    ),
                    Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.message),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.repeat),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite),
                            ),
                        ],
                    ),
                ],
            )
        );
    }
}
