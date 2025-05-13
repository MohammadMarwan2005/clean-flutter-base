part of 'main_cubit.dart';

@freezed
sealed class MainState with _$MainState {
  const factory MainState.loading() = _Loading;

  const factory MainState.done() = _Done;
}

extension Util on MainState {
  R when<R>({required R Function() done, required R Function() loading}) {
    switch (this) {
      case _Done():
        return done();
      case _Loading():
        return loading();
    }
  }
}
