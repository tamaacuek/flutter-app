import 'package:appflutter/model/user_model.dart';
import 'package:dio/dio.dart';
class UserService {
  static final Dio _dio = Dio(); // Jadikan _dio juga statik jika perlu
  static const _baseUrl = 'https://reqres.in/api';
  static const _users = 'users';

  static Future<List<UserModel>> fetchUser() async {
    // Tambahkan keyword "static"
    try {
      final response = await _dio.get(
        '$_baseUrl/$_users',
        queryParameters: {
          'page': '1',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        List<UserModel> users = List<UserModel>.from(
          data.map((user) => UserModel.fromJson(json: user)),
        );
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      rethrow;
    }
  }
}