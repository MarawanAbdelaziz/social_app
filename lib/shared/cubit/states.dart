//

abstract class SocialAppStates {}

class InitailState extends SocialAppStates {}


class GetUserLoadingState extends SocialAppStates {}

class GetUserSuccessState extends SocialAppStates {}

class GetUserErrorState extends SocialAppStates {
  final String error;

  GetUserErrorState(this.error);
}

class ChangeBottomNavState extends SocialAppStates {}

