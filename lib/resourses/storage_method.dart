import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';


class StorageMethods{
  FirebaseStorage store=FirebaseStorage.instance;
  FirebaseAuth auth=FirebaseAuth.instance;
  Future<String> uploadImage(String type,Uint8List file,bool ispost)async{
    Reference ref= store.ref().child(type).child(auth.currentUser!.uid);
    UploadTask uploadTask=ref.putData(file);
    TaskSnapshot snap= await uploadTask;
    String link= await snap.ref.getDownloadURL();
    return link;

  }
}
