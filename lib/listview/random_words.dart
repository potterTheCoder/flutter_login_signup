import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/utils/theme.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RandomWords {
  final String fname;
  final String lname;

  RandomWords({
    this.fname,
    this.lname,
  });
}

class RandomWordsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RandomWords>>(
      future: fetchRandomWords(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<RandomWords> data = snapshot.data;
          return randomWordsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.white24,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ));
      },
    );
  }

  Future<List<RandomWords>> fetchRandomWords() async {
    List<RandomWords> response = [];
    for (int i = 0; i < 15; i++) {
      response.add(new RandomWords(fname: WordPair.random().asPascalCase, lname: WordPair.random().asPascalCase));
    }
    return response;
  }

  ListView randomWordsListView(data) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 10),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 250),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: tile(data[index]),
              ),
            ),
          );
        });
  }

  Container tile(RandomWords data) => Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        width: double.maxFinite,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: color.shade700,
                  size: 50,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(data.fname.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, fontSize: 18, color: color.shade700)),
                        SizedBox(height: 5),
                        Divider(thickness: 1, color: color.shade300, height: 0),
                        SizedBox(height: 5),
                        Text(data.lname.toString(),
                            style: TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, fontSize: 16, color: color.shade500)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
