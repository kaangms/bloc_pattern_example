part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigateToUserView extends NavigationEvent {}

class NavigateToUserDetailView extends NavigationEvent {}
