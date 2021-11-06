class User {
  final String username;
  final String idUser;

  const User(this.username, this.idUser);

  String getId() {
    return idUser;
  }

  User.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        idUser = json["idUser"];

  Map<String, dynamic> toJson() => {
        'username': username,
        'idUser': idUser,
      };
  static const empty = User('-', '-');
}
