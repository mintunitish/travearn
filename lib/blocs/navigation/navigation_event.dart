part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigatedToDashboard extends NavigationEvent {}

class NavigatedToProfile extends NavigationEvent {}

class NavigatedToRewards extends NavigationEvent {}
