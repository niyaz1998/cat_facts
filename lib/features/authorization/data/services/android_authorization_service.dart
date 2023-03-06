import 'package:cat_facts/app/utils/consts.dart';
import 'package:cat_facts/features/authorization/domain/services/authorization_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Named(AppConsts.android)
@Injectable(as: AuthorizationService, env: [Environment.prod])
class AndroidAuthorizationService extends FirebaseAuthorizationService {
  @override
  Future<void> signIn() async {
    try {
      var googleSignIn = GoogleSignIn();
      var googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        var authResult = await googleSignInAccount.authentication;

        var credential = GoogleAuthProvider.credential(
          accessToken: authResult.accessToken,
          idToken: authResult.idToken,
        );

        await firebaseAuth.signInWithCredential(credential);
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
