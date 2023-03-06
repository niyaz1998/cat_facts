import 'package:cat_facts/features/email_authorization/domain/entities/email_auth_credentials_entity.dart';
import 'package:flutter/material.dart';

Future<EmailAuthCredentialsEntity?> showEmailAuthorizationDialog({
  required BuildContext context,
}) async {
  var result = await showDialog(
    context: context,
    builder: (context) => const EmailFirebaseAuthorizationDialog(),
  );
  if (result is EmailAuthCredentialsEntity) {
    return result;
  }
  return null;
}

class EmailFirebaseAuthorizationDialog extends StatefulWidget {
  const EmailFirebaseAuthorizationDialog({Key? key}) : super(key: key);

  @override
  State<EmailFirebaseAuthorizationDialog> createState() =>
      _EmailFirebaseAuthorizationDialogState();
}

class _EmailFirebaseAuthorizationDialogState
    extends State<EmailFirebaseAuthorizationDialog> {
  late final TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController(text: 'niyaz1998@yandex.ru');
    _passwordController = TextEditingController(text: 'password');
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please enter your credentials'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _emailController),
          const SizedBox(height: 12),
          TextField(controller: _passwordController, obscureText: true),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).maybePop(EmailAuthCredentialsEntity(
              email: _emailController.text,
              password: _passwordController.text,
            ));
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
