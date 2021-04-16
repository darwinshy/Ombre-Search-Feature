import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ombre/theme/theme.dart';
import 'package:stacked/stacked.dart';
import 'searchScreenEventTiles.dart';
import 'searchScreenViewModel.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              animationCurve: model.curve,
              animationDuration: model.animationDuration,
              buttonBackgroundColor: Colors.pink,
              backgroundColor: Colors.transparent,
              color: Color.fromRGBO(39, 46, 61, 0.8),
              items: const <Widget>[
                Icon(
                  Icons.filter_frames_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(13, 17, 26, 1),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: offBlack2),
                                hintText: "Start typing to search"),
                            onChanged: (e) => model.getQueriedResult(
                                e.toLowerCase().replaceAll(' ', '')),
                            controller: model.searchKey,
                            style: TextStyle(color: offWhite),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          color: Color.fromRGBO(39, 46, 61, 0.8),
                          onPressed: () =>
                              model.getQueriedResult(model.searchKey.text),
                        )
                      ],
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: !model.isSearched
                          ? model.stream
                          : model.queriedStream,
                      builder: (context, snapshot) {
                        try {
                          if (snapshot.data.docs.isNotEmpty)
                            return createEventsTile(snapshot.data.docs);
                          else
                            return Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                "No results found",
                                textAlign: TextAlign.start,
                                style: TextStyle(color: offBlack1),
                              ),
                            );
                        } catch (e) {
                          return Text("Error Occured");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => SearchViewModel());
  }
}
