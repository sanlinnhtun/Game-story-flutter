import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  storyText myStory = storyText();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              "Fantasy story game",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 52, 19, 98)),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/34101037_rm251-mind-08-f.jpg"),
              fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    myStory.getStoryTitle(currentIndex),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  onPressed: () {
                    debugPrint("You choicese choice 1");
                    setState(() {
                      currentIndex = myStory.getNextIndex(currentIndex, 1);

                    });
                  },
                  color: Colors.red,
                  child: Text(
                    myStory.getStoryCh1(currentIndex),
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  onPressed: () {
                    debugPrint("You choicese choice 2");
                    setState(() {
                      currentIndex = myStory.getNextIndex(currentIndex, 2);
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    myStory.getStoryCh2(currentIndex),
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 16, 22, 82),
    );
  }
}