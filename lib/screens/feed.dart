import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/sendtweet.dart';
import '../widgets/tweet.dart';

class FeedUpdate extends ChangeNotifier {
    final List<Twitt> twitts;
    FeedUpdate({required this.twitts });
    
    void add(Twitt result) {
        twitts.add(result);
        notifyListeners();
    }
}

class Feed extends StatefulWidget {
    final FeedUpdate feedUpdate;
    const Feed({Key? key, required this.feedUpdate}) : super(key: key);

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
                page = FeedPage(twitts: widget.feedUpdate.twitts,);
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
    
    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    Future<void> _navegateAndGetResult(BuildContext context) async {
        final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SendTwit()) 
        );
        if (!mounted) return;

        widget.feedUpdate.add(result);
    }
}

AppBar buildAppBar() {
    return AppBar( 
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
            children: [ 
                //const Icon(Icons.reorder, color: Colors.blue,),
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

class FeedPage extends StatelessWidget {
    final List<Twitt> twitts = [];
    FeedPage({Key? key, required twitts}) : super(key: key);
    @override 
    Widget build(BuildContext context) {
        return Center( 
            child: ListView( 
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                children: [ 
                    if (twitts.isEmpty)
                        const Text('Nothing to show', textAlign: TextAlign.center,)
                    else 
                        for (var twitt in twitts)
                            twitt,       
                ],
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
