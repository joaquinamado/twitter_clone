import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/widgets/twitt_model.dart';

class Twitt extends StatelessWidget {
    final TwittModel? datat = null;
    Twitt({ Key? key, required datat}) : super(key:key);

    @override
    Widget build(BuildContext context) {
        return Container( 
            padding: const EdgeInsets.all(20),
            child: Column( 
                children: [ 
                    ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        title: Text(datat!.creator),
                        leading: Text(datat!.text),
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
