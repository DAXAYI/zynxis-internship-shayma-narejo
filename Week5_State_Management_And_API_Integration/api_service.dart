import 'dart:convert';

import 'package:http/http.dart' as http;

import 'project_model.dart';

class ApiService {
  static const String apiUrl =
      'https://jsonplaceholder.typicode.com/posts';

  Future<List<Project>> fetchProjects() async {
    try {
      final response = await http
          .get(
        Uri.parse(apiUrl),
      )
          .timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
        jsonDecode(response.body);

        return jsonData
            .take(10)
            .map(
              (item) => Project.fromJson(item),
        )
            .toList();
      } else {
        throw Exception(
          'Server error: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw Exception(
        'Unable to fetch projects. '
            'Please check your internet connection.',
      );
    }
  }
}