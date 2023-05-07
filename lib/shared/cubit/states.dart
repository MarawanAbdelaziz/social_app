//

abstract class SocialAppStates {}

class InitailState extends SocialAppStates {}

class GetUserLoadingState extends SocialAppStates {}

class GetUserSuccessState extends SocialAppStates {}

class GetUserErrorState extends SocialAppStates {
  final String error;

  GetUserErrorState(this.error);
}

class GetPostsLoadingState extends SocialAppStates {}

class GetPostsSuccessState extends SocialAppStates {}

class GetPostsErrorState extends SocialAppStates {
  final String error;

  GetPostsErrorState(this.error);
}

class LikePostSuccessState extends SocialAppStates {}

class LikePostErrorState extends SocialAppStates {
  final String error;

  LikePostErrorState(this.error);
}

class ChangeBottomNavState extends SocialAppStates {}

class NewPostState extends SocialAppStates {}

class ProfileImagePickedSuccessState extends SocialAppStates {}

class ProfileImagePickedErrorState extends SocialAppStates {}

class CoverImagePickedSuccessState extends SocialAppStates {}

class CoverImagePickedErrorState extends SocialAppStates {}

class UploadProfileImageSuccessState extends SocialAppStates {}

class UploadProfileImageErrorState extends SocialAppStates {}

class UploadCoverImageSuccessState extends SocialAppStates {}

class UploadCoverImageErrorState extends SocialAppStates {}

class UserUploadLoadingState extends SocialAppStates {}

class UserUploadErrorState extends SocialAppStates {}

// Create Post

class CreatePostLoadingState extends SocialAppStates {}

class CreatePostSuccessState extends SocialAppStates {}

class CreatePostErrorState extends SocialAppStates {}

class PostImagePickedSuccessState extends SocialAppStates {}

class PostImagePickedErrorState extends SocialAppStates {}

class RemovePostImageState extends SocialAppStates {}
