class AppConst {
  static const int splashDelay = 3;
  static const String server = "https://ecommerceapp2023.000webhostapp.com/ecommerce";
  static const String test = "$server/test.php";

// ================================= Auth ========================== //
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCode = "$server/auth/verfiycode.php";

// ================================= forgetpassword ========================== //
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifyCodePassword = "$server/forgetpassword/verifycodepassword.php";



}