import 'package:app/models/Rota.dart';
import 'package:flutter/material.dart';

class InfoRota extends StatelessWidget {
  // In the constructor, require a Todo.
  const InfoRota({Key? key, required this.rota}) : super(key: key);

  // Declare a field that holds the Todo.
  final Rota rota;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(rota.rotaNome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(rota.rotaDisc),
      ),
    );
  }
}
