import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/global.dart';

class QuestionTile extends StatefulWidget {

  final String title;

  const QuestionTile({required this.title});

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {

  String? _answer = 'no';
  late TargetPlatform? platform;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFFDEDEDE))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children : [
            Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF33343C)),
                )
            ),
            Container(
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 'yes',
                          groupValue: _answer,
                          onChanged: (value) {
                            setState(() {
                              _answer = value;
                            });
                            Provider.of<GlobalData>(context, listen: false).plusScore();
                          },
                        ),
                        const Text('Yes'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 'no',
                          groupValue: _answer,
                          onChanged: (value) {
                            setState(() {
                              _answer = value;
                            });
                              // Provider.of<GlobalData>(context, listen: false).minusScore();
                              Provider.of<GlobalData>(context, listen: false).minusScore();
                            },

                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                ),
            )
          ]
        ),
      ),
    );
  }


}
