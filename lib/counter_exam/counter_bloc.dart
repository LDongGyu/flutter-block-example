import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent{

}

class DecrementCounter extends CounterEvent{

}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if(event is IncrementCounter){
      yield state+1;
    }
    if(event is DecrementCounter){
      yield state-1;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }
}