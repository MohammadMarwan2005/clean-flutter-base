part of 'test_cubit.dart';

@freezed
sealed class TestState with _$TestState {
  const factory TestState.initial() = _Initial;

  const factory TestState.loading() = _Loading;

  const factory TestState.success(SuccessAuthData response) = _Success;

  const factory TestState.error(DomainError error) = _Error;
}

extension X on TestState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(SuccessAuthData data) success,
    required R Function(DomainError error) onError,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success(:final response):
        return success(response);
      case _Error(:final error):
        return onError(error);
    }
  }
}
