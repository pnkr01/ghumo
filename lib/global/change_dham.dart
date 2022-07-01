import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ghumo/global/global.dart';
import 'package:ghumo/home/places/db.dart';

class ChangeDham extends StatefulWidget {
  final String? message;

  const ChangeDham({Key? key, this.message}) : super(key: key);

  @override
  State<ChangeDham> createState() => _ChangeDhamState();
}

class _ChangeDhamState extends State<ChangeDham> {
  Db db = Db();
  List<String> item = [
    'Badrinath',
    'Dwarka',
    'Puri',
    'Rameswaram',
  ];
  String? selectedItem = sharedPreferences!.getString('dham') ?? 'Puri';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // key: key,
      content: Material(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            items: item
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ),
                )
                .toList(),
            onChanged: (item) => setState(() {
              selectedItem = item as String;
              if (kDebugMode) {
                print(selectedItem);
              }
              db.changeDham(selectedItem!);
              sharedPreferences!.setString('dham', selectedItem!);
              Navigator.pop(context);
              Phoenix.rebirth(context);
            }),
            value: selectedItem,
          ),
        ),
      ),
    );
  }
}
