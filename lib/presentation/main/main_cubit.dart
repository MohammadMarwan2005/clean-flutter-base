import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.dart';

part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.loading()) {
    test();
  }

  void test() async {
    await Future.delayed(Duration(seconds: 3));
    emit(MainState.done());
  }
}
