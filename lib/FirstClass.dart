import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FirstClass extends StatefulWidget {
  const FirstClass({super.key});

  @override
  State<FirstClass> createState() => _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {
  ///these are the initial textediting controller jo screen pa show hona han
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();

  List<Map<String, TextEditingController>> listOfControllers = [];

  List<Map<String, Widget>> listOfFields = [];

  @override
  void initState() {
    super.initState();

    ///initial controller assighn ho raha han yahn
    listOfControllers = [
      {"first": first, "second": second, "third": third, "fourth": fourth}
    ];

    listOfFields = [
      {
        "first": TextFormField(
          controller: first,
        ),
        "second": TextFormField(
          controller: second,
        ),
        "third": TextFormField(
          controller: third,
        ),
        "fourth": TextFormField(
          controller: fourth,
        ),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('First Class'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listOfFields.map((e) {
            return Row(
              children: [
                Expanded(child: e['first']!),
                Expanded(child: e['second']!),
                Expanded(child: e['third']!),
                Expanded(child: e['fourth']!),
              ],
            );
          }).toList(),
        ),
      ),
      // body: Column(
      //   children: [
      //    Expanded(
      //       child: Row(
      //         children: [
      //           Expanded(
      //               child: TextFormField(
      //             decoration: InputDecoration(hintText: 'Raw Material'),
      //           )),
      //           Expanded(
      //               child: TextFormField(
      //             decoration: InputDecoration(hintText: 'Quantity'),
      //           )),
      //           Expanded(
      //               child: TextFormField(
      //             decoration: InputDecoration(hintText: 'Rate'),
      //           )),
      //           Expanded(
      //               child: TextFormField(
      //             decoration: InputDecoration(hintText: 'Amount'),
      //           )),
      //         ],
      //       ),
      //     ),
      //   ],

      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              List<String> data = [];

              listOfControllers.forEach((element) {
                TextEditingController first = element['first']!;
                TextEditingController second = element['second']!;
                TextEditingController third = element['third']!;
                TextEditingController fourth = element['fourth']!;
                data.add(first.text + second.text + third.text + fourth.text);
                first.clear();
                second.clear();
                third.clear();
                fourth.clear();
              });
              print(data);
            },
            child: Icon(Icons.headphones),
          ),
          FloatingActionButton(
              onPressed: () {
                TextEditingController first = TextEditingController();
                TextEditingController second = TextEditingController();
                TextEditingController third = TextEditingController();
                TextEditingController fourth = TextEditingController();

                ///here we add new controllers
                listOfFields.add({
                  'first': TextFormField(
                    controller: first,
                  ),
                  'second': TextFormField(
                    controller: second,
                  ),
                  'third': TextFormField(
                    controller: third,
                  ),
                  'fourth': TextFormField(
                    controller: fourth,
                  )
                });

                listOfControllers.add({
                  "first": first,
                  "second": second,
                  "third": third,
                  "fourth": fourth
                });
                setState(() {});
              },
              child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
