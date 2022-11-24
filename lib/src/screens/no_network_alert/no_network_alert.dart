import 'package:flutter/material.dart';

class NoNetworkAlertWidget extends StatelessWidget {
  const NoNetworkAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: const Text('No network connection'),
        ),
      ),
    );
  }
}
