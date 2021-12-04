part of 'widgets.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  String _title;
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new JobPage(),
    new OrderHistoryPage(),
    new ProfilePage()
  ];

  @override
  initState() {
    super.initState();
    _title = 'Home';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bottomNavCurrentIndex != 2
          ? AppBar(
              title: Text(_title),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => SearchPage()));
                  },
                ),
              ],
            )
          : null,
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                child: DrawerHeader(
                  child: Text(
                    'Menu',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              ListTile(
                title: Text('Login Disini'),
                onTap: () {
                  // Navigator.push(context,
                  //     CupertinoPageRoute(builder: (context) => Login()));
                },
              ),
              // DividerLine(
              //   height: 0.5,
              //   padding: 0.0,
              //   color: Colors.grey,
              // ),
              ListTile(
                title: Text('Kebijakan'),
                onTap: () {
                  // Navigator.push(context,
                  //     CupertinoPageRoute(builder: (context) => Kebijakan()));
                },
              ),
              // DividerLine(
              //   height: 0.5,
              //   padding: 0.0,
              //   color: Colors.grey,
              // ),
              ListTile(
                title: Text('Pengaturan'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // DividerLine(
              //   height: 0.5,
              //   padding: 0.0,
              //   color: Colors.grey,
              // ),
              ListTile(
                title: Text('Update Aplikasi'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // DividerLine(
              //   height: 0.5,
              //   padding: 0.0,
              //   color: Colors.grey,
              // ),
            ],
          ),
        ),
      ),
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blue.shade400,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        height: 55,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
            switch (index) {
              case 0:
                {
                  _title = 'Home';
                }
                break;
              case 1:
                {
                  _title = 'Bookmark';
                }
            }
          });
        },
        index: _bottomNavCurrentIndex,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.bookmark_outline,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: () {
//               if (onTap != null) {
//                 onTap(0);
//               }
//             },
//             child: Container(
//               height: 32,
//               width: 32,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'assets/ic_home' +
//                           ((selectedIndex == 0) ? '.png' : '_normal.png'),
//                     ),
//                     fit: BoxFit.contain),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               if (onTap != null) {
//                 onTap(1);
//               }
//             },
//             child: Container(
//               height: 32,
//               width: 32,
//               margin: EdgeInsets.symmetric(horizontal: 83),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'assets/ic_order' +
//                           ((selectedIndex == 1) ? '.png' : '_normal.png'),
//                     ),
//                     fit: BoxFit.contain),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               if (onTap != null) {
//                 onTap(2);
//               }
//             },
//             child: Container(
//               height: 32,
//               width: 32,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'assets/ic_profile' +
//                           ((selectedIndex == 2) ? '.png' : '_normal.png'),
//                     ),
//                     fit: BoxFit.contain),
//               ),
//             ),
//           )
//         ],
//       ),
      
//     );

//   }
// }
