import 'package:flutter/material.dart';
import 'package:fitnessadmin/model/foodItem.dart'; // Make sure Food is imported

class Scannedqrcodesscreen extends StatelessWidget {
  final Food food; // This will hold the passed food data

  // Constructor to receive the food data
  Scannedqrcodesscreen({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(food.imageUrl),
            Text('Name: ${food.name}', style: TextStyle(fontSize: 24)),
            Text('Calories: ${food.calories}', style: TextStyle(fontSize: 18)),
            Text('Fats: ${food.fats}', style: TextStyle(fontSize: 18)),
            Text('Proteins: ${food.proteins}', style: TextStyle(fontSize: 18)),
            Text('Carbs: ${food.carbs}', style: TextStyle(fontSize: 18)),
            Text('Sodium: ${food.sodium}', style: TextStyle(fontSize: 18)),
            Text('Sugar: ${food.sugar}', style: TextStyle(fontSize: 18)),
            Text('Cholesterol: ${food.cholesterol}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
