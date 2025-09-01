import 'package:flutter/material.dart';

/// A common reusable readonly text field widget
class ReadOnlyTextField extends StatelessWidget {
  final String label;
  final String value;
  final bool obscure;

  const ReadOnlyTextField({
    super.key,
    required this.label,
    required this.value,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        readOnly: true,
        obscureText: obscure,
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ReadOnlyTextField(label: 'ID', value: user['id']?.toString() ?? ''),
            ReadOnlyTextField(label: 'Name', value: user['name'] ?? ''),
            ReadOnlyTextField(label: 'Email', value: user['email'] ?? ''),
            ReadOnlyTextField(
              label: 'Logged In',
              value: user['isLoggedIn'] == 0 ? 'false' : 'true',
            ),
            ReadOnlyTextField(
              label: 'Password',
              value: user['password'] ?? '',
              obscure: true,
            ),
          ],
        ),
      ),
    );
  }
}
