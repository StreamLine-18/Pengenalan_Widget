import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stateless vs Stateful Demo', home: HomePage());
  }
}

// 🔵 Main home page with navbar
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DemoPage(), // Page 1: your stateless/stateful demo
    SecondPage(), // Page 2: just a simple page
    ScaffoldPage(), // Page 3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'State'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Widget'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Scaffold'),
        ],
      ),
    );
  }
}

// 🔹 Page 1: Demo of Stateless & Stateful
class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless vs Stateful')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '🔹 StatelessWidget Example:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            MyStatelessBox(text: 'I never change!'),

            Divider(height: 40),

            Text(
              '🔸 StatefulWidget Example:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            MyStatefulCounter(),
          ],
        ),
      ),
    );
  }
}

// 🔸 Page 2: Show most-used Flutter widgets
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Most Used Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('1️⃣ Text'),
            Text('This is a simple Text widget.'),

            Divider(),

            SectionTitle('2️⃣ Container'),
            Container(
              width: double.infinity,
              height: 80,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Container with background',
                style: TextStyle(color: Colors.white),
              ),
            ),

            Divider(),

            SectionTitle('3️⃣ Row'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.thumb_up, color: Colors.blue),
              ],
            ),

            Divider(),

            SectionTitle('4️⃣ Column'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Item 1'), Text('Item 2'), Text('Item 3')],
            ),

            Divider(),

            SectionTitle('5️⃣ Image'),
            Image.network(
              'https://flutter.dev/assets/homepage/carousel/slide_1-bg-4e2fcefecf98a32956543d4d6ac613a5ac85b2e1fa89bbf908db8b931ef6c183.jpg',
              height: 150,
              fit: BoxFit.cover,
            ),

            Divider(),

            SectionTitle('6️⃣ ElevatedButton'),
            ElevatedButton(onPressed: () {}, child: Text('Press Me')),

            Divider(),

            SectionTitle('7️⃣ ListView'),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [demoCard('Card 1'), demoCard('Card 2'), demoCard('Card 3')],
              ),
            ),

            Divider(),

            SectionTitle('8️⃣ Icon'),
            Icon(Icons.access_alarm, size: 50, color: Colors.purple),

            Divider(),

            SectionTitle('9️⃣ Card'),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Card Title'),
                subtitle: Text('Card Subtitle'),
              ),
            ),

            Divider(),

            SectionTitle('🔟 TextField'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper widget for section titles
  Widget SectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  // Helper widget for demo cards
  Widget demoCard(String text) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      child: Card(color: Colors.tealAccent, child: Center(child: Text(text))),
    );
  }
}

// 🚩 StatelessWidget
class MyStatelessBox extends StatelessWidget {
  final String text;
  const MyStatelessBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blueAccent,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

// 🚩 StatefulWidget
class MyStatefulCounter extends StatefulWidget {
  @override
  _MyStatefulCounterState createState() => _MyStatefulCounterState();
}

class _MyStatefulCounterState extends State<MyStatefulCounter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          color: Colors.orangeAccent,
          child: Text(
            'Counter: $_counter',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(onPressed: _increment, child: Text('Increase Counter')),
      ],
    );
  }
}

// 🔸 Page 3: Describe Scaffold widget with AppBar color change
class ScaffoldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 🔥 AppBar color changed to deepPurple
        backgroundColor: Colors.deepPurple,
        title: Text('Scaffold Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What is Scaffold?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '🔹 Scaffold is a basic structure for visual layout in Flutter apps.\n\n'
                'It provides:\n'
                '- AppBar (top bar)\n'
                '- Body (main content)\n'
                '- FloatingActionButton\n'
                '- Drawer (side menu)\n'
                '- BottomNavigationBar\n\n',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('This is a SnackBar!')));
        },
        child: Icon(Icons.message),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text('This is BottomAppBar', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
