import 'dart:convert';

import 'package:fic4_tugas_4_api/json_serialization/json_manual/user.dart';

void main(List<String> args) {
  const String jsonString = """
{
    "name": "Sabrina",
    "email": "sabrina@binar.co.id"
}
""";

  Map<String, dynamic> userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);

  print('Halo, ${user.name}!');
  print('Email verification link: ${user.email}');

  String json = jsonEncode(user);

  print('String json: $json');
}
