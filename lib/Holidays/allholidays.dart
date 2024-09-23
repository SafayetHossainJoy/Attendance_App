import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hrms/Holidays/holidays_model.dart';
import 'package:hrms/Login/login_service.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class HolidaysListPage extends StatefulWidget {
  @override
  _HolidaysListPageState createState() => _HolidaysListPageState();
}

class _HolidaysListPageState extends State<HolidaysListPage> {
  late Future<List<Holiday>> holidaysFuture;

  @override
  void initState() {
    super.initState();
    holidaysFuture = fetchHolidays();
  }

  // Function to fetch holidays from API
Future<List<Holiday>> fetchHolidays() async {
  var headers = {
  'Content-Type': 'application/json',
  'Cookie': 'frontend_lang=en_US; session_id=${auth.currentSessionId}'
    };
  var request = http.Request('GET', Uri.parse('https://vxservice17.xsellencebdltd.com/api/public_holidays'));
  request.body = json.encode({
    "jsonrpc": "2.0",
    "params": {
        "access_token": auth.currentAccessToken,
        "secret_key": auth.currentSecretKey,
        "api_key": auth.currentApiKey,
        "user_id": auth.currentUserId
    }
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    
    // Print the entire response body to the console for debugging
    print("API Response: $responseBody");

    // Decode the JSON response
    final Map<String, dynamic>? jsonResponse = json.decode(responseBody);

    // Check if 'result' and 'public_holidays' exist in the response
    if (jsonResponse != null && jsonResponse.containsKey('result')) {
      final result = jsonResponse['result'] as Map<String, dynamic>?;

      if (result != null) {
        print("Result keys: ${result.keys}");  // Print the keys inside 'result'

        if (result.containsKey('public_holidays')) {
          final holidaysJson = result['public_holidays'] as List<dynamic>;

          // Map each holiday JSON to a Holiday object
          return holidaysJson.map((holidayJson) => Holiday.fromJson(holidayJson)).toList();
        } else {
          // If 'public_holidays' key is missing or null
          print("Error: 'public_holidays' key is missing or null in the API response.");
          return [];
        }
      } else {
        print("Error: 'result' object is null in the API response.");
        return [];
      }
    } else {
      // If 'result' key is missing or null
      print("Error: 'result' key is missing or null in the API response.");
      return [];
    }
  } else {
    // Log the error if the API call fails
    print("Failed to fetch holidays. Status code: ${response.statusCode}");
    throw Exception('Failed to load holidays');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Holidays List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: FutureBuilder<List<Holiday>>(
        future: holidaysFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No holidays found'));
          }

          final holidays = snapshot.data!;
          return ListView.builder(
            itemCount: holidays.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.event, // Default icon for now
                      size: 30,
                      color: Colors.blue, // Default color for now
                    ),
                    title: Text(
                      holidays[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd MMMM yyyy').format(holidays[index].dateFrom),
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        Text(
                          DateFormat('EEEE').format(holidays[index].dateFrom),
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
