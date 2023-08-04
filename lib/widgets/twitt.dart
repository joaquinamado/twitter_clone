import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/twitt_model.dart';


class Twitt extends StatefulWidget {
    final AsyncSnapshot<List<TwittModel>?> snapshot;
    final BuildContext context;
    final int index;
    final BuildContext c;
    const Twitt({
        Key? key,
        required this.snapshot,
        required this.context,
        required this.index,
        required this.c,
        }) : super(key: key);

  @override
  State<Twitt> createState() => _TwittState();
}

class _TwittState extends State<Twitt> {
    bool fav = false;
    @override 
    Widget build(BuildContext context) {
        final controllerUsr = Get.put(UserController());
        return ListTile( 
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
            leading: const Icon(Icons.person),
            title: FutureBuilder(
                future: controllerUsr.getUserData(widget.snapshot.data![widget.index].creator),
                builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                        return RichText(
                           text: TextSpan(
                                text:  '${snapshot.data!.name}' ' ',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                                children: <TextSpan> [
                                    TextSpan(
                                        text: '${snapshot.data!.email}' ' ',
                                        style: const TextStyle(fontSize: 10, color: Colors.grey)
                                        ),

                                    if(24 > DateTime.now()
                                    .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                    .inHours || DateTime.now()
                                    .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                    .inHours  > 0) 
                                        TextSpan(
                                        text: 
                                            '${DateTime.now()
                                            .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                            .inHours.toString()}'
                                             'h',
                                        style: const TextStyle( 
                                            fontSize: 10,
                                            color: Colors.grey,
                                            )
                                        )
                                    else  
                                        if( 24 < DateTime.now()
                                        .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                        .inHours) TextSpan( 
                                            text:
                                            '${DateTime.now()
                                            .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                            .inDays.toString()}'
                                             'd',
                                            style: const TextStyle( 
                                                fontSize: 10,
                                                color: Colors.grey,
                                                )
                                             ),
                                        if( DateTime.now()
                                        .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                        .inHours < 0) 
                                            TextSpan(
                                                text:
                                                    '${DateTime.now()
                                                    .difference(widget.snapshot.data![widget.index].timestamp.toDate())
                                                    .inMinutes.toString()}' 'm',
                                                style: const TextStyle( 
                                                    fontSize: 10,
                                                    color: Colors.grey,
                                                )
                                             )
                                ]
                            )
                        );
                    }
                    else {
                        return const Center(child: CircularProgressIndicator(),);
                    }
                }
            ),
            subtitle: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                    Text(widget.snapshot.data![widget.index].text, style: const TextStyle(color: Colors.black),),
                    Row( 
                        children: [ 
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.message, size: 15,),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.repeat, size: 15,),
                            ),
                            IconButton(
                                onPressed: () {
                                    setState(() {
                                        fav = !fav;
                                    });
                                },
                                icon: fav == false? const Icon(Icons.favorite, size: 15,color: Colors.grey,): 
                                    const Icon(Icons.favorite, color: Colors.red, size: 15,),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share, size: 15,),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}
