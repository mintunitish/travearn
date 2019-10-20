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
import 'package:travearn/blocs/registration/registration_bloc.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: BlocProvider<RegistrationBloc>(
          builder: (context) => RegistrationBloc(userRepository: _userRepository),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}