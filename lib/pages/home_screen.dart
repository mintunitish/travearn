/*
 * This file and all its content are part of travearn and can be used only by 
 * including the LICENSE shipped with this code and by adhering to it fully.
 *
 * Created on 19-10-2019.
 * 
 * Copyright (c) 2019 Nitish Kumar. All rights reserved.
 *
 */

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:travearn/blocs/navigation/navigation_bloc.dart';
import 'package:travearn/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final UserRepository _userRepository;

  HomeScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NavigationBloc _navBloc;
  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _navBloc = NavigationBloc(userRepository: _userRepository);
  }

  @override
  void dispose() {
    _navBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _navBloc,
        builder: (context, NavigationState state) {
          if (state is ShowDashboard) {
            return Container(
              child: Center(
                child: Text('Dashboard'),
              ),
            );
          }
          else if (state is ShowProfile) {
            return Container(
              child: Center(
                child: Text('Profile'),
              ),
            );
          }
          else if (state is ShowRewards) {
            return Container(
              child: Center(
                child: Text('Rewards'),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.dashboard,
              title: 'Dashboard'
          ),
          TabData(
              iconData: Icons.person,
              title: 'Profile'
          ),
          TabData(
              iconData: Icons.card_giftcard,
              title: 'Rewards'
          ),
        ],
        onTabChangedListener: (position) {
          switch(position) {
            case 0:
              _navBloc.add(NavigatedToDashboard());
              break;
            case 1:
              _navBloc.add(NavigatedToProfile());
              break;
            case 2:
              _navBloc.add(NavigatedToRewards());
              break;
          }
        },
      ),
    );
  }


}