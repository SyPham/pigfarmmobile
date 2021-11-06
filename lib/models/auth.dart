
class AuthResponse {
  final String token;
  final Object user;

  AuthResponse(this.token, this.user);

  String getToken() {
    return token;
  }

  AuthResponse.fromJson(Map<String, dynamic> json)
      : token = json["token"],
        user = json["user"];

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user,
      };
}