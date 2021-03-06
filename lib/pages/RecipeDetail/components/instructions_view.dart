import 'package:flutter/material.dart';

class InstructionsView extends StatelessWidget {
  final String instructions;
  const InstructionsView(this.instructions, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        initiallyExpanded: true,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          "Instructions",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        children: [
          Padding(
              padding: const EdgeInsets.all(30),
              child: Text(instructions, style: TextStyle(fontSize: 15)))
        ]);
    //Column(
    //   children: [
    //     Container(
    //       alignment: Alignment.centerLeft,
    //       child: const Padding(
    //           padding: EdgeInsets.only(top: 5, bottom: 5, left: 15),
    //           child: Text("Instructions:",
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
    //     ),
    //     Padding(
    //         padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
    //         child: Text(instructions,
    //             style: TextStyle(
    //                 fontSize: 15,
    //                 foreground: Paint()..style = PaintingStyle.fill
    // )
    // ))
    //   ],
    // );
  }
}
