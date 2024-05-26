import 'dart:convert';

import 'package:flutter_testing/common/common.dart';
import 'package:flutter_testing/models/api_response.dart';
import 'package:flutter_testing/models/user.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> login(String username, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String url =
        "https://fb9b483e-22a0-4e29-9306-0106f7443310.mock.pstmn.io/login/pegawai";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'content-type':
            'application/x-www-form-urlencoded', // Mengatur header content type
      },
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      // Periksa apakah body response tidak kosong
      apiResponse.data = User.fromJson(jsonDecode(response.body));
      print(response.body);
    } else {
      // Jika status code bukan 200, beri tahu bahwa sesuatu telah salah
      apiResponse.error = 'Something went wrong';
      print(response.body);
    }
  } catch (e) {
    // Jika terjadi error dalam proses request, beri tahu bahwa terjadi kesalahan pada server
    apiResponse.error = 'Server error';
  }
  return apiResponse;
}
