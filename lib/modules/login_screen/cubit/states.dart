abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLodaingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginStates {}
