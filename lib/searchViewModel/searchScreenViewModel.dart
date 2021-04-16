import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchViewModel extends StreamViewModel<QuerySnapshot> {
  final Curve _curve = Curves.easeInOutCirc;
  final Duration _animationDuration = const Duration(milliseconds: 500);
  Curve get curve => _curve;
  Duration get animationDuration => _animationDuration;

  TextEditingController _searchKey = TextEditingController(text: "");
  TextEditingController get searchKey => _searchKey;
  bool isSearched = false;
  Stream<QuerySnapshot> queriedStream;

  void getQueriedResult(String query) {
    if (query == null) return;
    query.length == 0 ? isSearched = false : isSearched = true;
    queriedStream = FirebaseFirestore.instance
        .collection("events")
        .where("caseSearch", arrayContains: query)
        .snapshots();
    notifyListeners();
  }

  @override
  Stream<QuerySnapshot> get stream =>
      FirebaseFirestore.instance.collection("events").snapshots();
}
