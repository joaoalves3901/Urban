import 'package:app/screens/login_page.dart';
import 'package:app/screens/mapa_page.dart';
import 'package:app/screens/rotas_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [MapaPage(), RotasPage(), LoginPage()];
  void _onPageChanged(int index) {}
  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Rotas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Login',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
  




// import 'package:app/screens/login_page.dart';
// import 'package:app/screens/mapa_page.dart';
// import 'package:app/screens/rotas_page.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   PageController _pageController = PageController();
//   List<Widget> _screens = [LoginPage(), RotasPage(), MapaPage()];
//   void _onPageChanged(int index) {}
//   void _onItemTapped(int selectedIndex) {
//     _pageController.jumpToPage(selectedIndex);
//     print(selectedIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PageView(
//           controller: _pageController,
//           children: _screens,
//           onPageChanged: _onPageChanged,
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: _onItemTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.map),
//               label: 'Mapa',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.route),
//               label: 'Rotas',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle),
//               label: 'Login',
//             ),
//           ],
//         ));
//   }
// }
