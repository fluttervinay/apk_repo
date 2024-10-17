import 'package:flutter/material.dart';

class Demoscreen extends StatefulWidget {
  const Demoscreen({super.key});

  @override
  State<Demoscreen> createState() => _DemoscreenState();
}

class _DemoscreenState extends State<Demoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEMO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Recipe Name
            Text(
              'Recipe Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Ingredients
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Ingredient 1, Ingredient 2, Ingredient 3',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Instructions
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Step 1: Instruction 1\nStep 2: Instruction 2\nStep 3: Instruction 3',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Prep Time, Cook Time, Servings, Difficulty, Cuisine, Calories per Serving
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Prep Time:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '10 minutes',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Cook Time:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '20 minutes',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Servings:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Difficulty:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Easy',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Cuisine:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Italian',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Calories per Serving:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '250',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Tags
            Text(
              'Tags:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tag 1, Tag 2, Tag 3',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Image
            Image.asset('image.jpg'),
            SizedBox(height: 16),

            // Review Count, Rating
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Review Count:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '10',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Rating:',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Meal Type
            Text(
              'Meal Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Breakfast',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
