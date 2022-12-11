import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
        automaticallyImplyLeading: false,
        /*automatic sign of leading in
       stack of pages*/
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //for scrolling kinda page
        child: Column(
          children: [
            Image.asset("images/witcher.jpg"),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blue,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "this is a text widget",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Elevated button');
              },
              child: const Text("Elevated Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Outlined button');
              },
              child: const Text("Outlined Button"),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Text button');
              },
              child: const Text("Text Button"),
            ),
            /*GestureDetector widget in flutter is used to detect
             physical interaction with the application on the UI*/
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('This is the ROW'); //to write in terminal
              },
              child: Row(
                /*MainAxisAlignment used to set all the
              children array in horizontal format Place the free space evenly 
                between the children widget as well as before and after
                 the first widget and last child widget.
                */
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                  ),
                  Text("Row widget"),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  //Row and Column for multiple widget
                ],
              ),
            ),
            Switch(
              value: isSwitch,
              onChanged: (bool newBool) {
                setState(() {
                  isSwitch = newBool;
                });
              },
            ),
            Checkbox(
                value: isCheckbox,
                onChanged: (bool? newBool) {
                  setState(
                    () {
                      isCheckbox = newBool;
                    },
                  );
                }),
            Image.network(
                'https://tse2.mm.bing.net/th?id=OIP.MWpZGhLL9fBMFTQ466IHNQHaFj&pid=Api&P=0'),
          ],
        ),
      ),
    );
  }
}
