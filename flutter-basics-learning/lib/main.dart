import 'package:flutter/material.dart';
import 'package:flutter_learning/home_page.dart';
import 'package:flutter_learning/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];
  //must create this variable before build
  //otherwise it will rebuild everything
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.abc_sharp),
        // actions: const [
        //   Text('ok'),
        //   Icon(Icons.ac_unit_outlined),
        // ],
        title: const Text("Flutter"),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Clicked Floating Action Button')));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPage,
        onDestinationSelected: (value) {
          debugPrint(value.toString());

          /// to change ui, only in [StatefulWidget]
          setState(() {
            currentPage = value;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          /*NavigationDestination(icon: Icon(Icons.quiz), label: "Quiz"),*/
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
