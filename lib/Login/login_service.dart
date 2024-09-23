import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrms/BottomNavigation/bottomnav.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static final LoginService instance = LoginService._privateConstructor();

  LoginService._privateConstructor();

  factory LoginService() {
    return instance;
  }

  late SharedPreferences _prefs; // SharedPreferences instance

  // Initialize SharedPreferences
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter to access the current user ID
  String get currentUserId => _prefs.getString('currentUserId') ?? '';
  String get currentEmployeeId => _prefs.getString('employeeId') ?? '';
  String get currentSessionId => _prefs.getString('sessionId') ?? '';
  String get currentAccessToken => _prefs.getString('access_token') ?? '';
  String get currentSecretKey => _prefs.getString('secret_key') ?? '';
  String get currentApiKey => _prefs.getString('api_key') ?? '';
  String? get latitude => _prefs.getString('latitude');
  String? get longitude => _prefs.getString('longitude');

  // Define function to make login HTTP request
  authenticate(
      {required String username,
      required String password,
      required BuildContext context}) async {
    // Check if username or password is empty
    _prefs.clear();
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://vxservice17.xsellencebdltd.com/web/session/authenticate'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {"db": "vxservice17", "login": username, "password": password}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var setCookie = response.headers['set-cookie'];
    if (response.statusCode == 200 && setCookie != null) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      var sessionId = parseSessionId(setCookie);

      await saveInformation(
        currentUserId:
            jsonResponse['result']['user_settings']['user_id']['id'].toString(),
        employeeId: jsonResponse['result']['user_settings']['id'].toString(),
        sessionId: sessionId.toString(),
      );

      if (context.mounted) {
        await retrieveAccessToken(
            username: username,
            password: password,
            sessionId: currentSessionId,
            context: context);
      }
      // Handle successful response here
      // print(jsonResponse);
      // _showAlertDialog('Success', 'Authentication successful');
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => const Bottomnavi()),
      // );
    } else {
      print(response.reasonPhrase);

      if (context.mounted) {
        _showAlertDialog('Error',
            'Authentication failed: Invalid username or password', context);
      }
    }
  }

  saveInformation({
    required String currentUserId,
    required String employeeId,
    required String sessionId,
  }) async {
    await _prefs.setString('currentUserId', currentUserId);
    await _prefs.setString('employeeId', employeeId);
    await _prefs.setString('sessionId', sessionId);
  }
  
  
  Future<void> saveLocation({
    required String latitude,
    required String longitude,
  }) async {
    await _prefs.setString('latitude', latitude);
    await _prefs.setString('longitude', longitude);
  }

  String? parseSessionId(String setCookie) {
    // Split the 'Set-Cookie' header into its components
    var cookies = setCookie.split(';');
    for (var cookie in cookies) {
      if (cookie.trim().startsWith('session_id=')) {
        return cookie.trim().substring('session_id='.length);
      }
    }
    return null;
  }

  Future<void> retrieveAccessToken({
    required String sessionId,
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=$sessionId'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://vxservice17.xsellencebdltd.com/api/retrive-access-token/'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {"db": "vxservice17", "username": username, "password": password}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      var setCookie = response.headers['set-cookie'];
      var sessionId = parseSessionId(setCookie.toString());

      if (jsonResponse['result'] != null) {
        var result = json.decode(jsonResponse['result']);
        String accessToken = result['access_token'];
        String secretKey = result['secret_key'];
        String apiKey = result['api_key'];
        print('Access Token: $accessToken');
        print('Secret Key: $secretKey');
        print('API Key: $apiKey');

        await saveSecretInfo(
          accessToken: accessToken,
          secretKey: secretKey,
          apiKey: apiKey,
          sessionId: sessionId.toString(),
        );

        if (context.mounted) {
          await validateToken(
            context: context,
            secretKey: currentSecretKey,
            accessToken: currentAccessToken,
            sessionId: currentSessionId,
            apiKey: currentApiKey,
          );
        }
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  saveSecretInfo({
    required String accessToken,
    required String secretKey,
    required String apiKey,
    required String sessionId,
  }) async {
    await _prefs.setString('access_token', accessToken);
    await _prefs.setString('secret_key', secretKey);
    await _prefs.setString('api_key', apiKey);
    await _prefs.setString('sessionId', sessionId);
  }

  Future<void> validateToken({
    required String sessionId,
    required String accessToken,
    required String secretKey,
    required String apiKey,
    required BuildContext context,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=$sessionId'
    };

    var request = http.Request(
        'POST',
        Uri.parse(
            'https://vxservice17.xsellencebdltd.com/api/attendance/validate_token'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": accessToken,
        "secret_key": secretKey,
        "api_key": apiKey
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      print('validate : $jsonResponse ');

      if (jsonResponse['result'] != null) {
        var result = json.decode(jsonResponse['result']);
        if (result['message'] == "Access token is valid" && context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Bottomnavi()),
          );
        }
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> signOut() async {
    _prefs.clear();
  }
}

Future<void> _showAlertDialog(
    String title, String message, BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

final auth = LoginService.instance;
