import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:fluteco/utility/transformQuerySnapshot.dart';
import 'package:flutter/material.dart';
import '../widgets/admin/ManageProduct.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  NetworkHelper _helper = new NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _helper.getAllProducts().get();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () async {
                  var result =
                      await Navigator.pushNamed(context, '/edit-product');
                  print(result);
                  if (result) {
                    final snackBar = SnackBar(
                      content: Text('product added successfully'),
                      duration: Duration(milliseconds: 1500),
                      behavior: SnackBarBehavior.floating,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                },
                child: Icon(Icons.add),
              ),
            )
          ],
          title: Text(
            "Manage Products",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _helper.getAllProducts().snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return snapshot.data.docs.length == 0
                  ? Center(
                      child: Text('No Products to display'),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) => ManageProduct(
                        product: transformQuerySnapshot(
                          snapshot.data.docs[index],
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
