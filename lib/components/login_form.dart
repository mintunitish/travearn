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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travearn/blocs/authentication/authentication_bloc.dart';
import 'package:travearn/blocs/login/login_bloc.dart';
import 'package:travearn/components/buttons/create_account_button.dart';
import 'package:travearn/pages/register_screen.dart';
import 'package:travearn/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travearn/utils/form_helpers.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  LoginBloc _loginBloc;
  
  UserRepository get _userRepository => widget._userRepository;
  
  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  
  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text
      )
    );
  }
  
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Invalid Credentials!'),
                      Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: Colors.red,
                )
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Logging In...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
        }
        if(state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  autovalidate: true,
                  focusNode: _emailFocus,
                  onFieldSubmitted: (term) {
                    FormHelpers.fieldFocusChange(context, _emailFocus, _passwordFocus);
                  },
                  validator: (_) {
                    return !state.isEmailValid ? 'Invalid Email' : null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    obscureText: true,
                    autovalidate: true,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocus,
                    onFieldSubmitted: (term) {
                      _passwordFocus.unfocus();
                    },
                    validator: (_) {
                      return !state.isPasswordValid ? 'Invalid Password' : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
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
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.5)),
                          onPressed: isLoginButtonEnabled(state) ? _onFormSubmitted : null,
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
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginWithGooglePressed()
                              );
                            },
                            label: Text(
                              'SignIn With Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.5
                              ),
                            ),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: CreateAccountButton(userRepository: _userRepository)
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}