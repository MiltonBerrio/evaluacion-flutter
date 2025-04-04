import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  final List<dynamic>? cars;

  CarListScreen({required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Carros')),
      body: cars == null
          ? Center(child: Text('No hay carros disponibles'))
          : ListView.builder(
              itemCount: cars!.length,
              itemBuilder: (context, index) {
                final car = cars![index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.directions_car),
                    title: Text('Placa: ${car['placa']}'),
                    subtitle: Text('Conductor: ${car['conductor']}'),
                  ),
                );
              },
            ),
    );
  }
}
