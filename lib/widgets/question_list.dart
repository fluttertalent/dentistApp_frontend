import 'package:dentalcavity/widgets/question_tile.dart';
import 'package:flutter/material.dart';


class QuestionList extends StatefulWidget {
  final List<String> titleArray;
  final String Title;
  const QuestionList({super.key, required this.titleArray, required this.Title});
  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList>  with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return
      SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
            child: Text(
              widget.Title,
              style: const TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF33343C)),
            ),
          ),
          // Column(
          //   // Column is also a layout widget. It takes a list of children and
          //   // arranges them vertically. By default, it sizes itself to fit its
          //   // children horizontally, and tries to be as tall as its parent.
          //   //
          //   // Column has various properties to control how it sizes itself and
          //   // how it positions its children. Here we use mainAxisAlignment to
          //   // center the children vertically; the main axis here is the vertical
          //   // axis because Columns are vertical (the cross axis would be
          //   // horizontal).
          //   //
          //   // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          //   // action in the IDE, or press "p" in the console), to see the
          //   // wireframe for each widget.
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children:
          //     widget.titleArray.map((element) =>
          //         QuestionTile(
          //           title: element,
          //         ),
          //     ).toList()
          // ),
        ],
      )
    );

  }

}
