import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();
    String message = "";

    if (status.isGranted) {
      message = "${permission.toString()} granted!";
    } else if (status.isDenied) {
      message = "${permission.toString()} denied!";
    } else if (status.isPermanentlyDenied) {
      message = "${permission.toString()} permanently denied. Enable from settings.";
      await openAppSettings(); // User settings open karega
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permission Handling')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _requestPermission(Permission.camera),
              child: Text("Request Camera Permission"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _requestPermission(Permission.location),
              child: Text("Request Location Permission"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _requestPermission(Permission.storage),
              child: Text("Request Storage Permission"),
            ),
          ],
        ),
      ),
    );
  }
}
