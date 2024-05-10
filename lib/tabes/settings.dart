import 'package:flutter/material.dart';



class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  List<bool> _iconStates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView with Icon Toggle"),
      ),
      body: ListView.builder(
        itemCount: _iconStates.length,
        itemBuilder: (context, index) {
          return ListTile(

            title: Text("Item $index"),
            trailing: IconButton(
              icon: _iconStates[index]
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
              onPressed: () {
                setState(() {
                  if (index >= _iconStates.length) {
                    // If index is out of bounds, add more elements to the list
                    _iconStates.add(true); // Or initialize with the desired value
                  } else {
                    _iconStates[index] = !_iconStates[index];
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
