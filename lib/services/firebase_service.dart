import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mynotes/models/note.dart';
import 'package:mynotes/models/user.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      User? user = FirebaseAuth.instance.currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  addUserToFirebase(Users user) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _user = _firestore.collection('users');

    QuerySnapshot existingUser =
        await _user.where('email', isEqualTo: user.email).get();

    if (existingUser.docs.isEmpty) {
      _user.doc(user.email).set({
        'email': user.email,
        'name': user.name,
        'photoUrl': user.photoUrl,
      });
    }
  }

  Future<bool> addNoteToFirebase(String email, Note note) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final CollectionReference _note = _firestore.collection('notes');
      _note.add({
        'email': email,
        'title': note.title,
        'desc': note.desc,
        'tag': note.tag
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeNoteFromFirebase(Note note, String email) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final CollectionReference _note = _firestore.collection('notes');

      QuerySnapshot _thisNote = await _note
          .where('email', isEqualTo: email)
          .where('title', isEqualTo: note.title)
          .where('desc', isEqualTo: note.desc)
          .where('tag', isEqualTo: note.tag)
          .get();
      if (_thisNote.docs.isNotEmpty) {
        _note.doc(_thisNote.docs[0].id).delete();
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editNoteInFirebase(
      String email, Note newNote, Note oldNote) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final CollectionReference _note = _firestore.collection('notes');

      QuerySnapshot _thisNote = await _note
          .where('email', isEqualTo: email)
          .where('title', isEqualTo: oldNote.title)
          .where('desc', isEqualTo: oldNote.desc)
          .where('tag', isEqualTo: oldNote.tag)
          .get();
      if (_thisNote.docs.isNotEmpty) {
        _note.doc(_thisNote.docs[0].id).set({
          'email':email,
          'title':newNote.title,
          'desc':newNote.desc,
          'tag':newNote.tag
        },SetOptions(merge: true));
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeAllNotes(String email) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final CollectionReference _note = _firestore.collection('notes');

      QuerySnapshot _thisNote =
          await _note.where('email', isEqualTo: email).get();
      if (_thisNote.docs.isNotEmpty) {
        _thisNote.docs.forEach((element) {
          _note.doc(element.id).delete();
        });
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
