import 'package:flutter_test/flutter_test.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/repository/user_repository.dart';

void main() {
  test('postLogin returns a UserModel on success', () async {
    // Mock the http.post method to return a successful response
    // http.Client client = http.Client();
    // client.post = (url, {headers, body}) async =>
    //     http.Response('{"data": {"name": "John Doe"}}', 200);

    // Call the postLogin function
    Map<String, dynamic> data = {"username": "johndoe", "password": "password"};
    UserModel userModel = await UserRepository().postLogin(data: data);

    // Verify that the response is a UserModel with the correct name
    expect(userModel.user?.name, equals("John Doe"));
  });

  // test('postLogin throws an error on failure', () async {
  //   // Mock the http.post method to return a failed response
  //   http.Client client = http.Client();
  //   client.post = (url, {headers, body}) async =>
  //       http.Response('{"meta": {"message": "Invalid credentials"}}', 401);

  //   // Call the postLogin function
  //   Map<String, dynamic> data = {"username": "johndoe", "password": "password"};
  //   expect(postLogin(data: data), throwsA("Invalid credentials"));
  // });
}
