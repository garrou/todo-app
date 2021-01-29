import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignin = GoogleSignIn();

Future<User> signInWithGoogle() async {
  // User signin
  final GoogleSignInAccount googleSignInAccount = await googleSignin.signIn();
  // Get google authentification
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken
  );

  // Pass to firebase
  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  return user;
}

void signOutGoogle() async {
  await googleSignin.signOut();
}