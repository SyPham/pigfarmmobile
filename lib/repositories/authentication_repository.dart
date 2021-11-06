import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pigfarm/models/auth.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  var apiUrl =
      Uri.http('http://10.4.5.174:62', '/api/auth/login', {'q': '{http}'});
  Future<AuthResponse> authenticate(res) async {
    Map data = {'username': res.username, 'password': res.password};

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      _controller.add(AuthenticationStatus.authenticated);
      return AuthResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn(
      {required String username, required String password}) async {
    await Future.delayed(
      Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
  // Future<List<User>> getUser() async {
  //   Response res = await get(apiUrl);

  //   if (res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body);
  //     List<User> cases = body.map((dynamic item) => User.fromJson(item)).toList();
  //     return cases;
  //   } else {
  //     throw "Failed to load cases list";
  //   }
  // }

  // Future<User> getCaseById(String id) async {
  //   final response = await get('$apiUrl/$id');

  //   if (response.statusCode == 200) {
  //     return User.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load a case');
  //   }
  // }

  // Future<User> createCase(pUser cases) async {
  //   Map data = {
  //     'name': cases.name,
  //     'gender': cases.gender,
  //     'age': cases.age,
  //     'address': cases.address,
  //     'city': cases.city,
  //     'country': cases.country,
  //     'status': cases.status
  //   };

  //   final Response response = await post(
  //     apiUrl,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   if (response.statusCode == 200) {
  //     return pUser.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to post cases');
  //   }
  // }

  // Future<User> updatepUser(String id,User cases) async {
  //   Map data = {
  //     'name': cases.name,
  //     'gender': cases.gender,
  //     'age': cases.age,
  //     'address': cases.address,
  //     'city': cases.city,
  //     'country': cases.country,
  //     'status': cases.status
  //   };

  //   final Response response = await put(
  //     '$apiUrl/$id',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   if (response.statusCode == 200) {
  //     return pUser.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to update a case');
  //   }
  // }

  // Future<void> deleteCase(String id) async {
  //   Response res = await delete('$apiUrl/$id');

  //   if (res.statusCode == 200) {
  //     print("Case deleted");
  //   } else {
  //     throw "Failed to delete a case.";
  //   }
  // }

}
