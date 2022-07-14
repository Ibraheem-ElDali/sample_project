class LoginRequest {
  LoginRequest({
    this.userName,
    this.password,
    this.rememberMe,
    this.returnUrl,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      userName: json['userName'],
      password: json['password'],
      rememberMe: json['rememberMe'],
      returnUrl: json['returnUrl'],
    );
  }

  String? userName;
  String? password;
  String? rememberMe;
  String? returnUrl;

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
        'rememberMe': rememberMe,
        'returnUrl': returnUrl,
      };
}
