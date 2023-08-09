import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resourses/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file1,
  }) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.toString());
        String photoUrl =
            await StorageMethods().uploadImage('ProfilePic', file1, false);
        await _firestore.collection("Users").doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'password': password,
          'email': email,
          'bio': bio,
          'followings': [],
          'followers': [],
          'profilePhoto': photoUrl
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> Login({required String email, required String passwd})async {
    String res = "Some Error Occured";
    try{
      await _auth.signInWithEmailAndPassword(email: email,password: passwd);
      res='Successful login';
    }catch(e){
      res='please enter all the fields';
    }
    print(res);
    return res;
  }
}
