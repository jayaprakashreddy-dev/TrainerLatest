
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Info/variables.dart' as global;

class ApiService {
  static getCities() async {
    try {
      final response = await http.get('${global.url}/api/account/getcities',headers:{"Content-Type":"application/x-www-form-urlencoded","token":global.token});
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }
}
