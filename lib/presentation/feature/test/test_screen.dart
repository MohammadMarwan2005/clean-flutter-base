import 'package:clean_flutter_base/presentation/feature/test/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TestCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Test Screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: cubit.phoneNumberController),
              TextField(controller: cubit.passwordController),
              FilledButton(
                onPressed: () {
                  cubit.login();
                },
                child: Text("Login"),
              ),
              BlocBuilder<TestCubit, TestState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => SizedBox.shrink(),
                    loading: () => CircularProgressIndicator(),
                    success: (data) => Text("Success: name: ${data.firstName}, token: ${data.token}"),
                    onError: (error) => Text("Error: ${error.message}"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
