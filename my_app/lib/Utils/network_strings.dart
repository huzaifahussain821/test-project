class NetworkStrings {
  static const String API_BASE_URL =
      "https://server.appsstaging.com/1461/mvp/public/api/";
  static const String NETWORK_IMAGE_BASE_URL =
      "https://server.appsstaging.com/1461/mvp/public/";
  static const String ACCEPT = 'application/json';

  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;
  static const int CARD_ERROR_CODE = 402;
  static const int BAD_REQUEST_CODE = 400;
  static const int FORBIDDEN_CODE = 403;

  /////////// API MESSAGES /////////////////
  static const int API_SUCCESS_STATUS = 1;
  static const String EMAIL_UNVERIFIED = "0";
  static const String EMAIL_VERIFIED = "1";
  static const String PROFILE_INCOMPLETED = "0";
  static const String PROFILE_COMPLETED = "1";

  //Social Login Endpoints
  static const String SIGNUP_ENDPOINT = "user_create";
  static const String VERIFY_OTP_ENDPOINT = "user_verification";
  static const String RESEND_OTP_CODE_ENDPOINT = "re_send_code";
  static const String LOGIN_ENDPOINT = "user_login";
  static const String FORGET_PASSWORD_ENDPOINT = "forgot_password";
  static const String CHANGE_PASSWORD_ENDPOINT = "update_password";
  static const String COMPLETE_PROFILE_ENDPOINT = "complete_profile";
  static const String CONTENT_ENDPOINT = "content";
  static const String SOCIAL_LOGIN_ENDPOINT = "user_social_login";
  static const String SIGN_OUT_ENDPOINT = "logout";
  static const String OTHER_USER_PROFILE_ENDPOINT = "user_profile";

  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
  static const String ALREADY_SELECTED_DATE_TEXT = "Already Selected!";
  static const String INVALID_CARD_ERROR = "Invalid Card Details.";
  static const String CARD_TYPE_ERROR = "Wrong card type.";
  static const String INVALID_BANK_ACCOUNT_DETAILS_ERROR =
      "Invalid Bank Account Details.";
  static const String MERCHANT_ACCOUNT_ERROR =
      "Error:Merchant Account can not be created.";
  ///////////////////// CONTENT QUERY PARAMETERS /////////////////
  static const String TERMS_AND_CONDITIONS_CONTENT_PARAMETER = "tc";
  static const String PRIVACY_POLICY_CONTENT_PARAMETER = "pp";
  static const String ABOUT_APP_CONTENT_PARAMETER = "about";
  static const String DISCLAIM_CONTENT_PARAMETER = "disclaim";
  ////////////////////////// Camera Background Screen //////////////////////////

  static const String CAMERA_BACKGROUND_ENDPOINT = "camera/list";
  ///////////////////////// POST CREATE SCREEN ENDPOINT/////////////////////
  static const String POST_CREATE_ENDPOINT = "social_media/post_create";

  static const String FEEDS_SCREEN_ENDPOINT = "social_media/wall_feed?";

  static const String ADD_STORY_SCREEN_ENDPOINT =
      "social_media/story/story_create";
  static const String STORY_LIST_SCREEN_ENDPOINT =
      "social_media/story/story_list";
  static const String COMMENT_SCREEN_ENDPOINT =
      "social_media/post_comment_list?";
  static const String COMMENT_POST_ENDPOINT = "social_media/post_comment";
  static const String REPORT_POST_ENDPOINT =
      "social_media/report/create_report";
  static const String LIKE_POST_ENDPOINT = "social_media/post_like";
  static const String POST_LIKE_LIST_ENDPOINT = "social_media/post_like_list?";
  static const String MAP_SCREEN_ENDPOINT = "social_media/map/near_by_me";
  /////////////////////// USER PROFILE FEEDS /////////////////
  static const String USER_PROFILE_FEEDS_SCREEN_ENDPOINT =
      "social_media/user_profile_feed?";
  static const String USER_PROFILE_FEEDS_DELETE_SCREEN_ENDPOINT =
      "social_media/post_delete";
  ////////////////////// Notification Model //////////////////

  static const String NOTIFICATION_ENDPOINT = "social_media/notification_list";
  static const String CONTENT_TYPE_ENDPOINT = "social_media/admin/content_list";
  static const String LEARNING_MEDIA_TYPE_ENDPOINT =
      "social_media/admin/learning_media";
  static const String OTHER_PROFILE_ENDPOINT = "user_profile";
  static const String REQUEST_SEND_ENDPOINT = "roaster/request/send";
  /////////////////////// HISTORY /////////////////////

  ////////////////// CHAT ROOM ///////////////////
  static const String CHAT_ROOM_ENDPOINT = "chat_list";
 static const String CHAT_LIST_ENDPOINT = "social_media/chat/chat_list";
  //////////////// request update /////////
  static const String REQUEST_UPDATE = "roaster/request/update";
}
