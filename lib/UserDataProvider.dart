import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hrms/TotalDaysPerMonthCard/working_days_model.dart';
import 'package:hrms/UserProfileCard/userProfile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  UserProfile? _userProfile;
  WorkingDays? _workingDays;
  bool _isLoading = true;
  Timer? _updateTimer;

  UserProfile? get userProfile => _userProfile;
  WorkingDays? get workingDays => _workingDays;
  bool get isLoading => _isLoading;

  UserDataProvider() {
    _init();
  }

  Future<void> _init() async {
    await fetchUserData();
    _setupAutoUpdate();
  }

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('userProfile') && prefs.containsKey('workingDays')) {
      final userProfileData = prefs.getString('userProfile');
      final workingDaysData = prefs.getString('workingDays');

      _userProfile = UserProfile.fromJson(json.decode(userProfileData!));
      _workingDays = WorkingDays.fromJson(json.decode(workingDaysData!));

      _isLoading = false;
      notifyListeners();
    } else {
      await fetchUserProfile();
      await fetchWorkingDays();
    }
  }

  Future<void> fetchUserProfile() async {
    _isLoading = true;
    notifyListeners();

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/employee/user'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "user_id": 2
      }
    });
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseString);

        if (responseData['result'] != null) {
          var result = json.decode(responseData['result']);
          var userDetails = result[0];

          _userProfile = UserProfile.fromJson(userDetails);
          _isLoading = false;

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('userProfile', json.encode(userDetails));

          notifyListeners();
        } else {
          throw Exception("Result is null");
        }
      } else {
        throw Exception("Failed to load user profile");
      }
    } catch (e) {
      print("Error fetching user profile: $e");
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWorkingDays() async {
    _isLoading = true;
    notifyListeners();

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'frontend_lang=en_US; session_id=641f43d5298c3d0a1d839174cb796c63cd1ddf00'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://odoo17e.xsellencebdltd.com/api/access_token/employee/working_days/employee'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "access_token": "69961c52-0d2d-45fc-b074-2569996d2a88",
        "secret_key": "6933b91181e74ed2c93b9ff78ad3f872",
        "api_key": "1394ae6755d2862731871b489fa9444c",
        "employee_id": "1"
      }
    });
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseString);

        if (responseData['result'] != null) {
          String nestedResultString = responseData['result'];
          Map<String, dynamic> nestedResult = json.decode(nestedResultString);
          Map<String, dynamic> workingDaysData = nestedResult["1"];

          _workingDays = WorkingDays.fromJson(workingDaysData);

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('workingDays', json.encode(workingDaysData));

          _isLoading = false;
          notifyListeners();
        } else {
          throw Exception("Result is null");
        }
      } else {
        throw Exception("Failed to load working days");
      }
    } catch (e) {
      print("Error fetching working days: $e");
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    await fetchUserProfile();
    await fetchWorkingDays();
  }

  void _setupAutoUpdate() {
    _updateTimer?.cancel();
    _updateTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
      await refreshData();
    });
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    super.dispose();
  }
}