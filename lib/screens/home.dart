import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fluteco/models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';
import '../services/FirebaseFirestoreHelper.dart';
import '../widgets/home/FlutecoDrawer.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestoreHelper _helper = FirebaseFirestoreHelper();

  var listener;
  var subscription;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void connectionChanged(dynamic hasConnection) {
    if (hasConnection == ConnectivityResult.none) {
      setState(() {});
    }
  }

  // @override
  // void initState() {
  //   subscription =
  //       Connectivity().onConnectivityChanged.listen(connectionChanged);

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   subscription.cancle();
  //   print('dispose called');
  //   listener.cancel();
  //   super.dispose();
  // }

  // checkInternet() async {
  //   listener = DataConnectionChecker().onStatusChange.listen((_) {});
  //   return await DataConnectionChecker().hasConnection;
  // }

  @override
  Widget build(BuildContext context) {
    AppUser user = Provider.of<AppUser>(context);
    DataConnectionChecker().checkInterval = const Duration(seconds: 1);
    final SnackBar snackBar = SnackBar(
      content: Text('No Internet Connection'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(days: 365),
      action: SnackBarAction(
          textColor: Colors.amber,
          label: "Retry",
          onPressed: () {
            //rebuild the widget
            setState(() {});
          }),
    );

    return RefreshIndicator(
      onRefresh: () async {
        await _helper.getSpecialProducts().get();
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: FlutecoDrawer(),
        appBar: header(context),
        body: SingleChildScrollView(
            child: StreamBuilder<DataConnectionStatus>(
                stream: DataConnectionChecker().onStatusChange,
                builder: (context, snapshot) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (snapshot.hasData) {
                      print("Snapshot ${snapshot.data}");
                      if (snapshot.data == DataConnectionStatus.disconnected) {
                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      } else if (snapshot.data ==
                          DataConnectionStatus.connected)
                        _scaffoldKey.currentState.removeCurrentSnackBar();
                    }
                  });
                  return Body();
                })),
      ),
    );
  }
}
