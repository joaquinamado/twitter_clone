import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/twitts_controller.dart';
import '../screens/sendtweet.dart';
import '../widgets/twitt.dart';
import '../models/twitt_model.dart';

class Feed extends StatefulWidget {
    const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
    var _selectedIndex = 0;
    @override 
    Widget build(BuildContext context) {
        Widget page;
        switch (_selectedIndex) {
            case 0:
                page = const FeedPage();
                break;
            case 1:
                page = const SearchPage();
            case 2: 
                page = const NotificationsPage();
            case 3: 
                page = const InboxPage();
            default:
                throw UnimplementedError('No widget for $_selectedIndex');
        }
        return Scaffold( 
            appBar: buildAppBar(),
            bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black,
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem( 
                        icon: Icon(Icons.home),
                        label: 'Feed'
                    ),
                    BottomNavigationBarItem( 
                        icon: Icon(Icons.search),
                        label: 'Search'
                    ),
                    BottomNavigationBarItem( 
                        icon: Icon(Icons.notifications),
                        label: 'Notifications'
                    ),
                    BottomNavigationBarItem( 
                        icon: Icon(Icons.email),
                        label: 'Email'
                    ),
                ],
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
            ),
            body: Center( 
                child: page,
            ),
            drawer: Drawer( 
                backgroundColor: Colors.white,
                child: ListView( 
                    children: const [ 
                        ListTile( 
                            title: Text('Settings'),
                        )
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => {
                    _navegateAndGetResult(context),
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.send),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
    }
    Future<void> _navegateAndGetResult(BuildContext context) async {
            final int result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SendTwit()) 
        );
        
        _onItemTapped(result);
    }

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

}

class FeedPage extends StatefulWidget {
    const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {

    @override 
    Widget build(BuildContext context) {
        final controller = Get.put(TwittController());
        return Center( 
            child: FutureBuilder<List<TwittModel>?>(
              future: controller.getAllTwitts(), 
              builder: (context, snapshot) { 
                  if (snapshot.connectionState == ConnectionState.done) {
                      if(snapshot.data != null) {
                          return ListView.builder( 
                            itemCount: snapshot.data!.length,
                            itemBuilder: (c, index) { 
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [ 
                                            Twitt(snapshot: snapshot,context: context,index: index,c: c,),
                                    ],
                                );
                            }
                        );
                    }
                    else {
                        return const Center(child: Text('Nothing to show'),);
                    }
                }
                else {
                    return const Center(child: CircularProgressIndicator(),);
                }
              }
            ),
        );
    }
}
class SearchPage extends StatelessWidget {
    const SearchPage({Key? key}) : super(key: key);
    @override 
    Widget build(BuildContext context) {
        return const Center( 
            child: Text('Search Page'),
        );
    }
}
class NotificationsPage extends StatelessWidget {
    const NotificationsPage({Key? key}) : super(key: key);
    @override 
    Widget build(BuildContext context) {
        return const Center( 
            child: Text('Notifications Page'),
        );
    }
}

class InboxPage extends StatelessWidget {
    const InboxPage({Key? key}) : super(key: key);
    @override 
    Widget build(BuildContext context) {
        return const Center( 
            child: Text('Inbox Page'),
        );
    }
}

AppBar buildAppBar() {
    return AppBar( 
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
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

                const Icon(Icons.auto_awesome_sharp, color: Colors.blue,),
            ],
        ),
    );
}
