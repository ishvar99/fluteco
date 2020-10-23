import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/home/SearchBar.dart';
import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[createSilverAppBar1(), createSilverAppBar2()];
        },
        body: SingleChildScrollView(
          child: Body(),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      elevation: 0.0,
      toolbarHeight: getProportionateScreenWidth(38),
      // automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        titlePadding: EdgeInsets.only(
          bottom: getProportionateScreenWidth(4),
          left: getProportionateScreenWidth(70),
          right: getProportionateScreenWidth(10),
        ),
        title: header(context),
      ),
    );
  }
}

SliverAppBar createSilverAppBar2() {
  return SliverAppBar(
    elevation: 0.0,
    toolbarHeight: getProportionateScreenWidth(53),
    backgroundColor: Colors.deepOrange,
    automaticallyImplyLeading: false,
    pinned: true,
    floating: true,
    // titleSpacing: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      titlePadding: EdgeInsets.only(
        bottom: getProportionateScreenWidth(10),
        left: getProportionateScreenWidth(14),
        right: getProportionateScreenWidth(14),
      ),
      title: SearchBar(),
    ),
  );
}
