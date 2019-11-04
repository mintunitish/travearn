import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:travearn/repositories/user_repository.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final UserRepository _userRepository;

  NavigationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  NavigationState get initialState => ShowDashboard(_userRepository);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigatedToDashboard) {
      yield* _mapNavigatedToDashboardToState();
    }
    else if (event is NavigatedToProfile) {
      yield* _mapNavigatedToProfileToState();
    }
    else if (event is NavigatedToRewards) {
      yield* _mapNavigatedToRewardsToState();
    }
  }

  Stream<NavigationState> _mapNavigatedToDashboardToState() async* {
    yield ShowDashboard(_userRepository);
  }

  Stream<NavigationState> _mapNavigatedToProfileToState() async* {
    yield ShowProfile(_userRepository);
  }

  Stream<NavigationState> _mapNavigatedToRewardsToState() async* {
    yield ShowRewards();
  }
}
