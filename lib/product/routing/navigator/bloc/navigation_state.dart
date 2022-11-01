part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class OpenUserView extends NavigationState {}

class OpenUserDetailView extends NavigationState {}
