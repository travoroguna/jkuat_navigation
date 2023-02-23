import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin AppConfig {
  //firebase
  static FirebaseFirestore firebaseFiretore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
}

String mapKey = "AIzaSyBDOjOJB4-uVM2YssqKA0KNOwv8WSRxBd4";

String alanKey =
    "d1b158dc19cd18e782b59c4692b783132e956eca572e1d8b807a3e2338fdd0dc/stage";
