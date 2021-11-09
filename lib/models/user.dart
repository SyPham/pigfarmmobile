class User {
  final String username;
  final String idUser;

  const User(this.username, this.idUser);

  String getId() {
    return idUser;
  }

  User.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        idUser = json["id"];

  Map<String, dynamic> toJson() => {
        'username': username,
        'id': idUser,
      };
  static const empty = User('-', '-');
}
