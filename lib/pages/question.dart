import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../tools/api.dart';
import '../models/question.dart';
import '../utils/consts.dart';
import '../widgets/drawer.dart';
import '../widgets/question_tile.dart';

class QuestionListScreen  extends StatelessWidget {

  Map<int, String> _selectedOptions={
    1:'0',
    2:'0',
    3:'0',
    4:'0',
    5:'0',
    6:'0',
    7:'0',
    8:'0',
    9:'0',
    10:'0',
    11:'0',
    12:'-2',
    13:'-2',
    14:'0',
    15:'0',
    16:'0',
    17:'0',
    18: '0',
    19:'0',
    20:'0',
    21:'0',
    22:'0'
  };

  void _handleOptionSelected(Map<String, dynamic> question, String option) {
      _selectedOptions[question['id']] = option;

      print(_selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questions')),
      drawer: const DentalDrawer(
        username: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
      ),
      body: FutureBuilder<List<dynamic>>(
        future: QuestionService.fetchQuestions(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('You already answered to daily questions today.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length+1,
              itemBuilder: (context, index) {
                if (index == snapshot.data!.length) {
                // Build the submit button here
                      return ElevatedButton(
                          onPressed: () async {
                            // print(_selectedOptions);
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            int? user_id =await prefs.getInt('userId');
                            List<Map<String, dynamic>> dataArray = [];
                            String pub_date = DateFormat('yyyy-MM-dd').format(DateTime.now());
                            _selectedOptions.forEach((question_id, value) {
                                // Create a new element map
                                Map<String, dynamic> element = {
                                  "user": '${user_id}',
                                  "question": '${question_id}',
                                  "value": value,
                                  "pub_date": pub_date,
                                };
                            // Handle submit button press here
                            dataArray.add(element);
                            print(dataArray);
                          });
                            final result = await QuestionService.postAnswers(dataArray);
                            if (result['success']!) {
                              print(result);
                              showToast("Answers Submitted!");
                              // Navigate to the home screen or do something else
                            } else {
                              showToast("submission Failed!");
                            }
                          },
                          child: const Text('Submit'),
                      );
                      } else {
                            print(index);
                            var question = snapshot.data![index];
                            // var options = question['options'] != null ? question['options'].toString() : "None";
                            return QuestionTile(
                              question: question,
                              index: index,
                              onOptionSelected: _handleOptionSelected,
                          );
                      }
                 }
              );
          }
      }
    )
    );
  }
}

