import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'fire_base_functions.dart';

class ApiFunctions {
  static Future<int> checkHandle(String handle) async {
    http.Response response = await http.get(Uri.parse(
        'https://codeforces.com/api/user.info?handles=$handle'));
    if (response.statusCode == 200) {
      return 1;//testing
    } else {
      return 0;
    }
    return 0;
  }
  static Future<int> getRank(String handle) async {
    http.Response response = await http.get(Uri.parse(
        'https://codeforces.com/api/user.info?handles=$handle'));
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse['rating'];//testing
    } else {
      return -1;
    }
    return 0;
  }

}