import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _responseText = '';

  Future<void> fetchData() async {
    try {
      // APIga GET so'rovni yuborish
      final response = await http.get(Uri.parse('API_URL'));
      // Agar so'rov muvaffaqiyatli bo'lsa
      if (response.statusCode == 200) {
        // JSON javobni almashish
        final responseData = json.decode(response.body);
        setState(() {
          // Ma'lumotni ekranu o'zgartiramiz
          _responseText = responseData.toString();
        });
      } else {
        // Agar xato bo'lsa, xatolik haqida xabar chiqaramiz
        setState(() {
          _responseText = 'Xatolik yuz berdi: ${response.statusCode}';
        });
      }
    } catch (error) {
      // Agar umumiy xato bo'lsa, xatolik haqida xabar chiqaramiz
      setState(() {
        _responseText = 'Xatolik yuz berdi: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API bilan bog`lanish'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // fetchData funktsiyasini chaqiramiz
                  fetchData();
                },
                child: Text('Ma`lumotni olish'),
              ),
              SizedBox(height: 20),
              Text(
                _responseText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
