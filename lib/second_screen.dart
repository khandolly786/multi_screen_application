import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Column(
        children: [
          Expanded(
            child: Image.asset("assets/second.png", fit: BoxFit.cover),
          ),
          SizedBox(height: 20),
          Text(
            "This is the Second Screen!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Click below to go back",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
