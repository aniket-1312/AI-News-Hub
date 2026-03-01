import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';

class ApiService {
  Future<List<dynamic>> fetchNews(int page) async {
    final response = await http.get(Uri.parse(
        "${AppConstants.baseUrl}&page=$page&apiKey=${AppConstants.apiKey}"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['articles'];
    } else {
      throw Exception("Server Error");
    }
  }
}
