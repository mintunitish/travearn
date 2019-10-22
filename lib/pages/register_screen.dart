/*
 * This file and all its content are part of travearn and can be used only by 
 * including the LICENSE shipped with this code and by adhering to it fully.
 *
 * Created on 19-10-2019.
 * 
 * Copyright (c) 2019 Nitish Kumar. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travearn/blocs/registration/registration_bloc.dart';
import 'package:travearn/components/app_background.dart';
import 'package:travearn/components/registration_form.dart';
import 'package:travearn/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              AppBackground(),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 250,
                        child: new SvgPicture.asset(
                          'assets/images/undraw_Ride_a_bicycle_2yok.svg',
                          semanticsLabel: 'Registration Logo',
                        ),
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: MediaQuery.of(context).viewInsets.bottom
                        ),
                        child: BlocProvider<RegistrationBloc>(
                          builder: (context) => RegistrationBloc(userRepository: _userRepository),
                          child: RegistrationForm(),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}