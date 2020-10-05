import '../resources/constants.dart';
import 'package:flutter/material.dart';
import './Home.dart';
import './Wishlist.dart';
import './Feedback.dart';
import './About.dart';
import './Profile.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: kSecondaryColor.withOpacity(0.05),
          child: TabBar(
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black87,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.outlined_flag),
              ),
              Tab(
                icon: Icon(Icons.favorite_border),
              ),
              Tab(
                icon: Icon(Icons.person_outline),
              ),
              Tab(
                icon: Icon(Icons.mail_outline),
              ),
              Tab(
                icon: Icon(Icons.lightbulb_outline),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Home(),
            Wishlist(),
            Profile(),
            FeedBackInfo(),
            About()
          ],
        ),
      ),
    );
  }
}
