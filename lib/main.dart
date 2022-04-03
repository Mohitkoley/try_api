import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:try_api/page/user_local_page.dart';
import 'package:try_api/page/user_network_page.dart';

Future main() async {
  final String title = "Future Builder & json";
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system,
    home: MainPage(title: title),
  ));
}

class MainPage extends StatefulWidget {
  final String title;
  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Text('FutureBuilder'), label: 'Local'),
          BottomNavigationBarItem(
            icon: Text('FutureBuilder'),
            label: 'Network',
          ),
        ],
        onTap: (int index) => setState(() {
          this.index = index;
        }),
      ),
      body: buildPages(),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const UserlocalPage();
      case 1:
        return const UserNetworkPage();
      default:
        return Container();
    }
  }
}
