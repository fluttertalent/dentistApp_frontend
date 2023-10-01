import 'package:provider/provider.dart';
import '../utils/global.dart';
import '../widgets/drawer.dart';
import '../widgets/question_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}
List<QuestionList> ListArray= [
  const QuestionList(
    Title: 'Dietary Habits',
    titleArray: [
      "1.	Do you consume sugary snacks more than twice a day?",
      "2. Do you drink sugary beverages daily?",
      "3.	Do you eat sticky foods that adhere to teeth?",
      "4.	Do you regularly consume alcohol?",
      "5.	Do you frequently eat acidic foods?"
    ],
  ),
  const QuestionList(
    Title: 'Oral Hygiene',
    titleArray: [
      "6.	Do you brush less than twice a day?",
      "7.	Do you floss less than once a day?",
      "8.	Do you skip mouthwash?",
      "9.	Is your toothpaste fluoride-free?",
      "10.	Do you use a hard-bristled toothbrush?"
    ],
  ),
  const QuestionList(
    Title: 'Dental History',
    titleArray: [
      "11.	Have you had a cavity in the last 3 years?",
      "12.	Have you had a root canal treatment?",
      "13.	Do you have fillings that are over 5 years old?",
      "14.	Have you had frequent toothaches in the past year?",
      "15.	Do you have a history of gum disease?"
    ],
  ),
  const QuestionList(
    Title: 'Lifestyle Factors',
    titleArray: [
      "16.	Do you smoke or use tobacco products?",
      "17.	Do you frequently consume caffeine?",
      "18.	Are you under high levels of stress?",
      "19.	Do you have a dry mouth regularly?",
      "20.	Do you have a medical condition that requires medication affecting saliva flow?"
    ],
  ),
  const QuestionList(
    Title: 'Professional Care',
    titleArray: [
      "21.	Have you not visited a dentist in over a year?",
      "22.	Do you have untreated cavities?",
      "23.	Have you never had dental sealants?",
      "24.	Do you have overcrowded teeth?",
      "25.	Do you have exposed roots or gum recession?"
    ],
  ),
  const QuestionList(
    Title: 'Age & Developmental Factors',
    titleArray: [
      "26.	Are you under the age of 6?",
      "27.	Are you over the age of 65?",
      "28.	Are you pregnant?",
      "29.	Are you wearing orthodontic appliances?",
      "30.	Do you have dentures or bridges?"
    ],
  ),
  const QuestionList(
    Title: 'Professional Care',
    titleArray: [
      "31.	Is your tap water non-fluoridated?",
      "32.	Do you not use fluoride mouthwash?",
      "33.	Do you not receive fluoride treatments from your dentist?",
      "34.	Do you live in an area with low fluoride levels in drinking water?",
    ],
  ),
  const QuestionList(
    Title: 'Systemic Factors',
    titleArray: [
      "35.	Do you have diabetes?",
      "36.	Are you undergoing radiation therapy?",
      "37.	Are you HIV positive?",
      "38.	Do you have Sjogren’s Syndrome?",
      "39.	Do you have frequent respiratory infections?"
    ],
  ),
  const QuestionList(
    Title: 'Other Considerations',
    titleArray: [
      "40.	Do you breathe primarily through your mouth?",
      "41.	Do you have acid reflux?",
      "42.	Do you grind or clench your teeth?",
      "43.	Do you have visible plaque on your teeth?",
      "44.	Do you have visible tartar/calculus?",
      "45.	Do you have chipped or fractured teeth?",
      "46.	Do you have visible white spots on your teeth?",
      "47.	Do you have frequent bad breath?",
      "48.	Do you have frequent mouth sores?",
      "49.	Do you consume sports drinks frequently?",
      "50.	Do you chew on ice or hard candy?",
      "51.	Do you have a family history of cavities?",
      "52.	Do you share utensils or food, increasing bacterial transmission?",
      "53.	Do you have frequent sinus infections?",
      "54.	Do you snore or have sleep apnea?",
      "55.	Do you drink less than 8 cups of water daily?",
      "56.	Do you have a high-sugar diet?",
      "57.	Do you avoid using dental products with xylitol?",
      "58.	Do you have untreated tooth sensitivity?",
      "59.	Do you frequently consume fruit juices?",
      "60.	Do you avoid wearing a mouthguard during sports activities?"
    ],
  ),
];
class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin{

  int _currentPage = 0;
  late PageController _pageController;


  @override
  bool get wantKeepAlive => true;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showMessageBox(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(title),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(message),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      drawer: const DentalDrawer(
        username: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',

      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-60,
              child: PageView(
                controller: _pageController,
                children: const [
                  QuestionList(
                    Title: 'Dietary Habits',
                    titleArray: [
                      "1.	Do you consume sugary snacks more than twice a day?",
                      "2. Do you drink sugary beverages daily?",
                      "3.	Do you eat sticky foods that adhere to teeth?",
                      "4.	Do you regularly consume alcohol?",
                      "5.	Do you frequently eat acidic foods?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Oral Hygiene',
                    titleArray: [
                      "6.	Do you brush less than twice a day?",
                      "7.	Do you floss less than once a day?",
                      "8.	Do you skip mouthwash?",
                      "9.	Is your toothpaste fluoride-free?",
                      "10.	Do you use a hard-bristled toothbrush?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Dental History',
                    titleArray: [
                      "11.	Have you had a cavity in the last 3 years?",
                      "12.	Have you had a root canal treatment?",
                      "13.	Do you have fillings that are over 5 years old?",
                      "14.	Have you had frequent toothaches in the past year?",
                      "15.	Do you have a history of gum disease?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Lifestyle Factors',
                    titleArray: [
                      "16.	Do you smoke or use tobacco products?",
                      "17.	Do you frequently consume caffeine?",
                      "18.	Are you under high levels of stress?",
                      "19.	Do you have a dry mouth regularly?",
                      "20.	Do you have a medical condition that requires medication affecting saliva flow?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Professional Care',
                    titleArray: [
                      "21.	Have you not visited a dentist in over a year?",
                      "22.	Do you have untreated cavities?",
                      "23.	Have you never had dental sealants?",
                      "24.	Do you have overcrowded teeth?",
                      "25.	Do you have exposed roots or gum recession?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Age & Developmental Factors',
                    titleArray: [
                      "26.	Are you under the age of 6?",
                      "27.	Are you over the age of 65?",
                      "28.	Are you pregnant?",
                      "29.	Are you wearing orthodontic appliances?",
                      "30.	Do you have dentures or bridges?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Professional Care',
                    titleArray: [
                      "31.	Is your tap water non-fluoridated?",
                      "32.	Do you not use fluoride mouthwash?",
                      "33.	Do you not receive fluoride treatments from your dentist?",
                      "34.	Do you live in an area with low fluoride levels in drinking water?",
                    ],
                  ),
                  QuestionList(
                    Title: 'Systemic Factors',
                    titleArray: [
                      "35.	Do you have diabetes?",
                      "36.	Are you undergoing radiation therapy?",
                      "37.	Are you HIV positive?",
                      "38.	Do you have Sjogren’s Syndrome?",
                      "39.	Do you have frequent respiratory infections?"
                    ],
                  ),
                  QuestionList(
                    Title: 'Other Considerations',
                    titleArray: [
                      "40.	Do you breathe primarily through your mouth?",
                      "41.	Do you have acid reflux?",
                      "42.	Do you grind or clench your teeth?",
                      "43.	Do you have visible plaque on your teeth?",
                      "44.	Do you have visible tartar/calculus?",
                      "45.	Do you have chipped or fractured teeth?",
                      "46.	Do you have visible white spots on your teeth?",
                      "47.	Do you have frequent bad breath?",
                      "48.	Do you have frequent mouth sores?",
                      "49.	Do you consume sports drinks frequently?",
                      "50.	Do you chew on ice or hard candy?",
                      "51.	Do you have a family history of cavities?",
                      "52.	Do you share utensils or food, increasing bacterial transmission?",
                      "53.	Do you have frequent sinus infections?",
                      "54.	Do you snore or have sleep apnea?",
                      "55.	Do you drink less than 8 cups of water daily?",
                      "56.	Do you have a high-sugar diet?",
                      "57.	Do you avoid using dental products with xylitol?",
                      "58.	Do you have untreated tooth sensitivity?",
                      "59.	Do you frequently consume fruit juices?",
                      "60.	Do you avoid wearing a mouthguard during sports activities?"
                    ],
                  ),
                  // Add more pages as required
                ],
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            _currentPage == 8? ElevatedButton(
                style:ElevatedButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                ),
                onPressed: (){
                  final globalData = Provider.of<GlobalData>(context, listen: false);
                  int score = globalData.score;
                  _showMessageBox(
                    context,
                    (score> 90)? 'Very High Risk':(score >60)? 'High Risk':(score >30)? 'Moderate Risk':'Low Risk',
                    'Your score is : $score',
                  );
                }, child: const Text('Submit', style: TextStyle(fontSize: 20),)):const SizedBox(height: 60,),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10.0,
            left: 40.0,
            child: FloatingActionButton(
              onPressed: _previousPage,
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            bottom: 10.0,  // position it above the other FAB
            right: 10.0,
            child: FloatingActionButton(
              onPressed: _nextPage,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}