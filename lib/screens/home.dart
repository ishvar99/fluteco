import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fluteco/utility/connectivity.dart';
import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';
import '../services/NetworkHelper.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NetworkHelper _helper = NetworkHelper();

  var listener;
  var subscription;
  // StreamSubscription _connectionChangeStream;

  // bool isOffline = false;

  // @override
  // initState() {
  //   super.initState();

  //   ConnectionStatusSingleton connectionStatus =
  //       ConnectionStatusSingleton.getInstance();
  //   _connectionChangeStream =
  //       connectionStatus.connectionChange.listen(connectionChanged);
  // }

  void connectionChanged(dynamic hasConnection) {
    if (hasConnection == ConnectivityResult.none) {
      setState(() {});
    }
  }

  @override
  void initState() {
    subscription =
        Connectivity().onConnectivityChanged.listen(connectionChanged);

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancle();
    print('dispose called');
    listener.cancel();
    super.dispose();
  }

  checkInternet() async {
    print('check internet');
    print(await DataConnectionChecker().hasConnection);
    print("Current status: ${await DataConnectionChecker().connectionStatus}");
    print("Last results: ${DataConnectionChecker().lastTryResults}");
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });
    return await DataConnectionChecker().hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    // print(isOffline);
    final SnackBar snackBar = SnackBar(
      content: Text('No Internet Connection'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(days: 365),
      action: SnackBarAction(
          textColor: Colors.amber,
          label: "Retry",
          onPressed: () {
            setState(() {});
          }),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var status = await checkInternet();
      print("status $status");
      if (!status) {
        Scaffold.of(context).showSnackBar(snackBar);
      } else {
        Scaffold.of(context).removeCurrentSnackBar();
      }
    });
    return RefreshIndicator(
      onRefresh: () async {
        await _helper.getSpecialProducts().get();
      },
      child: Scaffold(
        drawer: Drawer(),
        appBar: header(context),
        body: SingleChildScrollView(child: Body()),
      ),
    );
  }
}
