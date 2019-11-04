part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class ShowDashboard extends NavigationState {
  final UserRepository userRepository;

  const ShowDashboard(this.userRepository);

  @override
  List<Object> get props => [userRepository];

  @override
  String toString() {
    return "Show Dashboard";
  }
}

class ShowProfile extends NavigationState {
  final UserRepository userRepository;

  const ShowProfile(this.userRepository);

  @override
  List<Object> get props => [userRepository];

  @override
  String toString() {
    return "Show Profile";
  }
}

class ShowRewards extends NavigationState {
  @override
  String toString() {
    return 'Show Rewards';
  }
}