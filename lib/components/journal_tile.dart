import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:journal/pages/tilepage.dart';

class JournalTile extends StatelessWidget {
  final String data;
  final Function() onDelete;
  final Function() onPressed;
  const JournalTile({
    super.key,
    required this.data,
    required this.onPressed,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 7, left: 10, right: 10),
      child: SizedBox(
        height: 100,
        width: 100,
        child: ListTile(
          leading: const Icon(Icons.abc),
          tileColor: Colors.white,
          title: Text(data),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TilePage(),
                ));
          },
        ),
      ),
    );
  }
}
