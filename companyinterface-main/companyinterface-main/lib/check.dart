// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    //throw UnimplementedError();
    return Checkwidget();
  }
}
//  Container(
//                           child: Row(
//                         children: <Widget>[
//                           IconButton(
//                               onPressed: () {}, icon: Icon(Icons.arrow_back)),
//                           Text(
//                             'some text',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       )),
class Checkwidget extends State {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "number",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black45,
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      backgroundColor: Colors.green,
                      label: const Text('print'),
                      icon: const Icon(Icons.print),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}
