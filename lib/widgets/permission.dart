// import 'dart:html';

// import 'package:flutter/material.dart';

// class PermissionHandlerExample extends StatefulWidget {
//   @override
//   _PermissionHandlerExampleState createState() =>
//       _PermissionHandlerExampleState();
// }

// class _PermissionHandlerExampleState extends State<PermissionHandlerExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Permission Handler Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Check and request camera and microphone permissions
//             await requestCameraAndMicrophonePermission();
//           },
//           child: Text('Request Camera and Microphone Permission'),
//         ),
//       ),
//     );
//   }

//   Future<void> requestCameraAndMicrophonePermission() async {
//     // Check if camera and microphone permissions are granted
//     var statusCamera = await Permission.camera.status;
//     var statusMicrophone = await Permission.microphone.status;

//     if (statusCamera.isGranted && statusMicrophone.isGranted) {
//       // Camera and microphone permissions are already granted
//       print('Camera and microphone permissions are already granted.');
//     } else {
//       // Request camera and microphone permissions
//       Map<Permission, PermissionStatus> statuses = await [
//         Permission.camera,
//         Permission.microphone,
//       ].request();

//       // Check if permissions are granted after the request
//       if (statuses[Permission.camera]!.isGranted &&
//           statuses[Permission.microphone]!.isGranted) {
//         print('Camera and microphone permissions granted.');
//       } else {
//         print('Camera and microphone permissions denied.');
//       }
//     }
//   }
// }
