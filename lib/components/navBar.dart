import 'package:flutter/material.dart';
/* import 'package:newsletter_app/pages/HomePage.dart';
import 'package:newsletter_app/pages/NewPostPage.dart';
import 'package:newsletter_app/pages/ProfilePage.dart';
*/
class navBar extends StatelessWidget {
  const navBar({super.key});

  @override
  Widget build(BuildContext context) {
    /* return BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem> [

          // home icon
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(AssetImage('assets/icons/home_icon.png')),
          ),

          // new post icon
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(AssetImage('assets/icons/post_icon.png')),
          ),

          //profile icon
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(AssetImage('assets/icons/user_icon.png')),
          ),
        ],
    );
    */

    return NavigationBar(
      destinations: [
      ],
    );
  }
}