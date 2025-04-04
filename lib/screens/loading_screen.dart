import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'car_list_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String token;

  LoadingScreen({required this.token});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  Future<void> _fetchCars() async {
    final cars = await _apiService.fetchCars(widget.token);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CarListScreen(cars: cars)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
