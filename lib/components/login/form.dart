import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/screens/Home.dart';
import 'package:fluteco/widgets/splash/RoundedButton.dart';
import 'package:flutter/material.dart';
import '../../screens/ForgotPassword.dart';
import '../../resources/constants.dart';
import '../../resources/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  bool _loading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(5),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(35)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(35)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: kOfferBannerColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(35)),
              width: double.infinity,
              height: 50,
              child: RoundedButton(
                loading: _loading,
                text: "Login",
                pressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    setState(() {
                      _loading = true;
                    });
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then(
                          (currentUser) => FirebaseFirestore.instance
                              .collection("users")
                              .doc(currentUser.user.uid)
                              .get()
                              .then((DocumentSnapshot result) {
                            setState(() {
                              _loading = false;
                            });
                            return Navigator.pushReplacementNamed(
                                context, Home.routeName);
                          }).catchError((err) {
                            setState(() {
                              _loading = false;
                            });
                            print(err);
                          }),
                        )
                        .catchError((err) {
                      setState(() {
                        _loading = false;
                      });
                      print(err);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.lock,
            size: getProportionateScreenWidth(18),
            color: Colors.teal[600],
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email,
          color: Colors.teal[600],
          size: getProportionateScreenWidth(18),
        ),
      ),
    );
  }
}
