import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_example/features/user/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToUserView>((event, emit) => emit(OpenUserView()));
    on<NavigateToUserDetailView>((event, emit) => emit(OpenUserDetailView()));
  }
}
