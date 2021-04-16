import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ombre/model/movie.dart';

Widget createEventsTile(List<DocumentSnapshot> documents) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      ...documents
          .map((data) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    Events.fromSnapshot(data).image,
                    height: 50,
                  ),
                  title: Text(
                    Events.fromSnapshot(data).subtitle,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.red[900],
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    Events.fromSnapshot(data).title,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ))
          .toList(),
    ],
  );
}
