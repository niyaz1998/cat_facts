import 'package:cat_facts/features/authorization/domain/state/authorization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AuthorizationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        if (state is NotAuthorizedState) {
          return AppBar(
            title: const Text('Please authorize to see cat facts'),
          );
        } else if (state is AuthorizedState) {
          return AppBar(
            title: const Text('Cat facts'),
            actions: [
              IconButton(
                onPressed: () {
                  AuthorizationBloc.of(context).add(
                    AuthorizationSignOutEvent(),
                  );
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          );
        }
        return AppBar(
          title: const Text('Authorization in progress'),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
