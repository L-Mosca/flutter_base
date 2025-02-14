class LoginResponse {
  String token;

  LoginResponse({required this.token});

  @override
  String toString() {
    return 'LoginResponse{token: $token}';
  }
}