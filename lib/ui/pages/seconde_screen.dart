import 'package:flutter/material.dart';
import 'package:task_onaisa/ui/pages/third_screen.dart';
import 'package:task_onaisa/ui/widgets/components.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defoaltAppbar(title: "The Second Page"),
      body: ListView.separated(
          itemBuilder: (context, index) => ListItem(cont: context),
          separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
          itemCount: 2),
    );
  }
}

Widget ListItem({BuildContext cont}) => InkWell(
      onTap: () {
        navigateTo(cont, ThirdScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "tilte: title",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "subject : subject",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "created at: created at",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
