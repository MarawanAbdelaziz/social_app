abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLodaingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class ChangePasswordVisibilityState extends RegisterState {}
