import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/home/FlutecoDrawerHeader.dart';
import 'package:flutter/material.dart';
import './FlutecoDrawerItem.dart';

class FlutecoDrawer extends StatelessWidget {
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
                'Hello, Ishan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(16)),
              ),
              accountEmail: Text('ishanvarshney99@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepOrange[50],
                child: Text(
                  "IV",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: getProportionateScreenWidth(30),
                  ),
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
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
            ),
            drawerBodyItem(
              icon: Icons.help,
              text: 'Help',
              onTap: () => Navigator.pushReplacementNamed(context, '/help'),
            ),
          ],
        ),
      ),
    );
  }
}
