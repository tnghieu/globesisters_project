import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:globesisters/screens/feed_screen.dart';
import 'package:globesisters/screens/post_screen.dart';
import 'package:globesisters/screens/profile_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarIndex = useState<int>(0);

    return Scaffold(
      body: IndexedStack(
        index: bottomNavigationBarIndex.value,
        children: const [
          FeedScreen(),
          PostScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          )
        ],
        onTap: (index) => bottomNavigationBarIndex.value = index,
        currentIndex: bottomNavigationBarIndex.value,
      ),
    );
  }
}
