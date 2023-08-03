import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/feed.dart';
import 'package:twitter_clone/services/post.dart';

class SendTwit extends StatefulWidget { 
    const SendTwit({Key? key}) : super (key: key);

  @override
  State<SendTwit> createState() => _SendTwitState();
}

class _SendTwitState extends State<SendTwit> {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final PostService _postService = PostService();
    String text = '';
    @override
    build(BuildContext context){
        return Scaffold( 
            appBar: AppBar( 
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white, 
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        TextButton(
                            onPressed: () async => {
                                Navigator.pop(context),
                            },
                            child: const Text('Cancel', style: TextStyle(color: Colors.black),),
                        ),
                        ElevatedButton(
                            onPressed: () async => {
                                _postService.savePost(text),
                                //Twitt(data: text, username: auth.currentUser!.uid),
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Feed()) 
                                //Twitt(data: text, username: auth.currentUser!.uid),
                                ),
                            },
                            child: const Text('Send'),
                        ),
                      ],
                    ),
            ),
            body: searchBox(), 
        );
    }

    Widget searchBox() {
        return Container( 
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: TextField( 
                onChanged: (value) {
                    setState(() {
                        text = value;                      
                    });
                },
                style: const TextStyle(color: Colors.black,),
                decoration: const InputDecoration( 
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'What\'s happening?',
                    hintStyle: TextStyle(color: Colors.grey),
                ),
            ),
        );
    }
}
