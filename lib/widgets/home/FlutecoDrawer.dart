import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/models/User.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/home/FlutecoDrawerHeader.dart';
import 'package:flutter/material.dart';
import './FlutecoDrawerItem.dart';

class FlutecoDrawer extends StatelessWidget {
  final AppUser user;
  FlutecoDrawer({this.user});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Drawer(
        child: ListView(
          children: [
            // false
            //     ?
            UserAccountsDrawerHeader(
              accountName: Text(
                'Hello, ${user.name}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(14)),
              ),
              accountEmail: Text("${user.email}"),
              currentAccountPicture: user.profilePhotoUrl == ""
                  ? CircleAvatar(
                      backgroundColor: Colors.deepOrange[50],
                      child: Text(
                        user.name
                            .trim()
                            .split(' ')
                            .map((l) => l[0])
                            .take(2)
                            .join()
                            .toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: getProportionateScreenWidth(30),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 4,
                      backgroundImage: CachedNetworkImageProvider(
                        user.profilePhotoUrl,
                      ),
                    ),
            ),
            // : SizedBox(
            //     height: getProportionateScreenWidth(70),
            //     child: DrawerHeader(
            //       child: Text('Login'),
            //     ),
            //   ),
            drawerBodyItem(
              icon: Icons.store,
              text: 'Home',
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            drawerBodyItem(
              icon: Icons.account_box,
              text: 'My Account',
              onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
            ),
            drawerBodyItem(
              icon: Icons.card_giftcard,
              text: 'My Orders',
              onTap: () => Navigator.pushReplacementNamed(context, '/orders'),
            ),
            Divider(),
            drawerBodyItem(
              icon: Icons.shopping_basket,
              text: 'Cart',
              onTap: () => Navigator.pushReplacementNamed(context, '/cart'),
            ),
            drawerBodyItem(
              icon: Icons.favorite,
              text: 'Wishlist',
              onTap: () => Navigator.pushReplacementNamed(context, '/whislist'),
            ),
            Divider(),
            drawerBodyItem(
              icon: Icons.help,
              text: 'Help',
              onTap: () => Navigator.pushReplacementNamed(context, '/help'),
            ),
            drawerBodyItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
