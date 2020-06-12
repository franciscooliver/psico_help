import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:psico_help/app/core/interfaces/auth_repository.dart';
import 'package:psico_help/app/core/responses/response_builder.dart';
import 'package:psico_help/app/core/responses/response_default.dart';

class AuthRepository implements IAuthRepository {
  FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {

      await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return ResponseBuilder.success<FirebaseUser>(
        object: await firebaseAuth.currentUser(),
      );

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      final GoogleSignIn googleSigIn = new GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount = await googleSigIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await firebaseAuth.signInWithCredential(credential)
          .then((auth) { firebaseUser = auth.user; });

        return ResponseBuilder.success<FirebaseUser>(
          object: firebaseUser,
          message: "Usuário logou com sucesso"
        );
      }
    } catch (e) {
		 return ResponseBuilder.failed(object: e, message: e.toString());
	 }
  }

  @override
  Future<DefaultResponse> doRegisterEmail() async {
    
   
  }

  @override
  Future<DefaultResponse> doRegisterEmailPassword({String email, String password}) async {
    try {
      return await firebaseAuth
        .createUserWithEmailAndPassword(email: email.trim(), password: password.trim())
        .then((auth) => 
          ResponseBuilder.success<FirebaseUser>(object: auth.user));
    } catch (e) {
    }
  }

  @override
  Future<DefaultResponse> getUSer() async {
   try {
      return ResponseBuilder.success<FirebaseUser>(object: await firebaseAuth.currentUser());
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

}
