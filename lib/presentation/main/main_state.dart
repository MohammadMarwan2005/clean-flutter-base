part of 'main_cubit.dart';

@freezed
sealed class MainState with _$MainState {
  const factory MainState.loading() = MainStateLoading;
  const factory MainState.done() = MainStateDone;
}

extension Util on MainState {
  R when<R>({required R Function() done, required R Function() loading}) {
    switch (this) {
      case MainStateDone():
        return done();
      case MainStateLoading():
        return loading();
    }
  }
}
