import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver{

  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit} ${change}');
    super.onChange(cubit, change);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit} ${stackTrace}');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc} ${transition}');
    super.onTransition(bloc, transition);
  }

}