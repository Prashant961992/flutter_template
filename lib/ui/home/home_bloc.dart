import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:template/ui/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(UnHomeState(0));
  
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'HomeBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
