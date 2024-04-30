import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journal/components/journal_tile.dart';
import 'package:journal/services/firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  FirestoreService journals = FirestoreService();
  void openDialogBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textEditingController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'N I K K I',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
          stream: journals.getJournals,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List journalList = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: journalList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = journalList[index];
                    return JournalTile(
                      data: doc['journal'],
                    );
                  });
            } else {
              return Text('LOADING DATA');
            }
          }),
      backgroundColor: Color.fromARGB(255, 247, 150, 182),
    );
  }
}
