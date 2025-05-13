import 'package:bloc/bloc.dart';
import 'package:clean_flutter_base/domain/model/domain_error.dart';
import 'package:clean_flutter_base/domain/model/resource.dart';
import 'package:clean_flutter_base/domain/model/auth/auth_response.dart';
import 'package:clean_flutter_base/domain/model/auth/login_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repo/auth_repo.dart';

part 'test_state.dart';

part 'test_cubit.freezed.dart';

class TestCubit extends Cubit<TestState> {
  final AuthRepo _authRepo;

  TextEditingController phoneNumberController = TextEditingController(
    text: "0998146546",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Aa@12345",
  );

  TestCubit(this._authRepo) : super(const TestState.initial());

  void login() async {
    emit(TestState.loading());
    final response = await _authRepo.login(
      LoginRequest(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        fcmToken: "null",
      ),
    );
    switch(response) {
      case Success<AuthResponse>():
        emit(TestState.success(response.data.data));
      case Error<AuthResponse>():
        emit(TestState.error(response.error));
    }
  }
}
