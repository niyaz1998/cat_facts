import 'package:cat_facts/app/widgets/cat_loader.dart';
import 'package:cat_facts/features/authorization/domain/state/authorization_bloc.dart';
import 'package:cat_facts/features/authorization/presentation/widgets/auhtorization_app_bar.dart';
import 'package:cat_facts/features/cat_facts/presentation/widgets/cat_facts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthorizationAppBar(),
      body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (BuildContext context, state) {
          if (state is NotAuthorizedState) {
            return Center(
              child: TextButton(
                onPressed: () {
                  AuthorizationBloc.of(context).add(AuthorizationSignInEvent());
                },
                child: const Text('Log in'),
              ),
            );
          } else if (state is AuthorizedState) {
            return const CatFactsListView();
          }
          return const Center(child: CatLoader());
        },
      ),
    );
  }
}
