import 'package:flutter/material.dart';
import 'package:travearn/blocs/authentication/authentication_bloc.dart';
import 'package:travearn/components/app_background.dart';
import 'package:travearn/pages/home_screen.dart';
import 'package:travearn/pages/login_page.dart';
import 'package:travearn/pages/splash_screen.dart';
import 'package:travearn/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted()),
      child: App(userRepository: userRepository),
    )
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  const App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travearn',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            fontFamily: 'Open Sans'
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark
        ),
        home: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                AppBackground(),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is Uninitialized) {
                      return SplashScreen();
                    }
                    if (state is Authenticated) {
                      return HomeScreen(name: state.displayName);
                    }
                    if (state is Unauthenticated) {
                      return LoginPage();
                    }
                  },
                ),
              ],
            ),
            backgroundColor: Colors.white,
          ),
        )
    );
  }
}
