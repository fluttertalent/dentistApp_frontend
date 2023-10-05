import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {
  final Map<String, dynamic> question;
  final int index;
  final Function(Map<String, dynamic> question, String option) onOptionSelected;

  QuestionTile({required this.question, required this.index, required this.onOptionSelected});

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  late bool yesNo;
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    yesNo = widget.question['yes_no'];
    selectedOption = yesNo ? '0' : widget.question['options'].keys.first.toString();
  }

  void _handleOptionSelected(String value) {

    setState(() {
      selectedOption = value;
    });
    widget.onOptionSelected(widget.question, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Text((widget.index + 1).toString() + ". "),
            Flexible(child: Text(widget.question['text'])),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 45.0),
              Expanded(child: yesNo ? _buildYesNoOptions() : _buildOtherOptions()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYesNoOptions() {
    return Row(
      children: [
        _buildOption(widget.question['weight'].toString(),'Yes'),
        _buildOption('0', 'No'),
      ],
    );
  }

  // Widget _buildOtherOptions() {
  //   var options = (widget.question['options'] as Map<String, dynamic>).values.toList();
  //   var vals = (widget.question['options'] as Map<String, dynamic>).keys.toList();
  //   var option_pairs = (widget.question['options'] as Map<String, dynamic>);
  //   print(option_pairs);
  //
  //   return
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: options.map((option) => _buildOption(option.toString())).toList(),
  //     );
  // }

  Widget _buildOtherOptions() {
    var option_pairs = (widget.question['options'] as Map<String, dynamic>);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: option_pairs.entries.map((entry) {
        var key = entry.key;
        var option = entry.value;
        return _buildOption(key, option);
      }).toList(),
    );
  }

  Widget _buildOption(String key, String option) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: key,
          groupValue: selectedOption,
          onChanged: (value) {
            _handleOptionSelected(value!);
            },
        ),
        Text(option),
      ],
    );
  }
}
