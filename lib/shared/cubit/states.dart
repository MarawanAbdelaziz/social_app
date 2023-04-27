//

abstract class SocialAppStates {}

class InitialStates extends SocialAppStates {}

class ChangeCurrentIndexStates extends SocialAppStates {}

class GetUserLoadingState extends SocialAppStates {}

class GetUserSuccessState extends SocialAppStates {}

class GetUserErrorState extends SocialAppStates {
  final String error;

  GetUserErrorState(this.error);
}
