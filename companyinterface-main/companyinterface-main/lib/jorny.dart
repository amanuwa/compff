import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class jorny extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return jornywidget();
  }
}

class jornywidget extends State {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      return Scaffold(
        body: Container(
          child: LayoutBuilder(builder: (context, Constraints) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          color: Colors.white,
                          child: Text('Add/Remove journey'),
                        ),
                        Container(
                          width: 250,
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          color: Colors.white,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "write journey"),
                          ),
                        ),
                        Container(
                          width: 40,
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          color: Colors.white,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "general_id"),
                          ),
                        ),
                        Container(
                          width: 40,
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          color: Colors.white,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "journey_id"),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          child: ElevatedButton.icon(
                            onPressed: () async {},
                            label: const Text("Add"),
                            icon: Icon(Icons.add),
                          ),
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          child: ElevatedButton.icon(
                            onPressed: () async {},
                            label: const Text("Remove"),
                            icon: Icon(Icons.remove),
                          ),
                        )
                      ],
                    );
                  }),
                )
              ],
            );
          }),
        ),
      );
    });
  }
}
