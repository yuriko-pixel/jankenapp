import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: JankenPage(),
   );
 }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = "✊";
  String computerHand = "✊";
  String result = "引き分け";
  
  void selectHand(String selectedHand) {
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch(randomNumber) {
      case 0:
        return "✊";
      case 1:
        return "✌";
      case 2:
        return "✋";
      default:
        return "✊";
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = "引き分け";
      setState(() {});
    } else if (
      myHand == "✊" && computerHand == "✌" || 
      myHand == "✋" && computerHand == "✊"
    ) {
      result = "勝ち";
      setState(() {});
    } else {
      result = "負け";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('じゃんけん')),
      body: Center(
        child: Column(children: [
          Text(result, style: TextStyle(fontSize: 32)),
          SizedBox(height: 48),
          Text("コンピュータ "+computerHand, style: TextStyle(fontSize: 32)),
          SizedBox(height: 48),
          Text("自分 "+myHand, style: TextStyle(fontSize: 32)),
          SizedBox(height: 16),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            ElevatedButton(
              onPressed: (){
                selectHand('✊');
              },
              child: Text('✊')
            ),
            ElevatedButton(
              onPressed: (){
                selectHand('✌');
              },
              child: Text('✌')
            ),
            ElevatedButton(
              onPressed: (){
                selectHand('✋');
              },
              child: Text('✋')
            ),
        ])
        ]),)
    );
  }
}