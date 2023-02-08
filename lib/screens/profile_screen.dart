import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.2,
                color: Theme.of(context).secondaryHeaderColor,
                child: const Icon(Icons.photo),
              ),
            ),
            Text(
              'Tony Nghieu',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '28',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Software Developer',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
