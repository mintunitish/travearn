/*
 * This file and all its content are part of travearn and can be used only by 
 * including the LICENSE shipped with this code and by adhering to it fully.
 *
 * Created on 13-10-2019.
 * 
 * Copyright (c) 2019 Nitish Kumar. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                'Hello,',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90.0),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        labelText: 'Mobile Number',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          print('hello');
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.5)),
                            onPressed: () {
                              print('hello');
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.5),
                            ),
                            color: Color(int.parse('#5d9dfe'.substring(1, 7),
                                    radix: 16) +
                                0xFF000000),
                            elevation: 10,
                            highlightElevation: 2,
                            splashColor: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            height: 50.0,
                            child: RaisedButton.icon(
                              elevation: 10,
                              highlightElevation: 2,
                              splashColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.5),
                              ),
                              icon: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print('Hello');
                              },
                              label: Text(
                                'SignIn With Google',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.5),
                              ),
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 11.0),
                          child: FlatButton(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            onPressed: () {
                              print('hi');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
