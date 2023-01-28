import 'package:flutter/material.dart';

import '../controller/menuItem.dart';

class Menuitems {
  static const home = MenuItemDrawer('Home', Icons.home);
  static const profile = MenuItemDrawer('Profile', Icons.person);

  static const gallery = MenuItemDrawer('Gallery', Icons.image_outlined);
  static const MemberShip =
      MenuItemDrawer('MemberShip', Icons.card_membership_rounded);
  static const privacypolicy =
      MenuItemDrawer('Privacy Policy', Icons.privacy_tip_outlined);
  static const termsncondition =
      MenuItemDrawer('Terms & Condition', Icons.local_police_outlined);
  static const logout = MenuItemDrawer('Logout', Icons.logout);

  static const all = <MenuItemDrawer>[
    home,
    profile,
    gallery,
    MemberShip,
    privacypolicy,
    termsncondition,
    logout,
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItemDrawer currentItem;
  final ValueChanged<MenuItemDrawer>? onselectedItem;
  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onselectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        // backgroundColor: Colors.grey,

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey, Colors.yellow.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              ...Menuitems.all.map(BuildMenuItem).toList(),
              Spacer()
            ],
          )),
        ),
      ),
    );
  }

  Widget BuildMenuItem(MenuItemDrawer item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black45,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onselectedItem!(item),
        ),
      );
}


// class MenuPage extends StatefulWidget {
//   final MenuItem currentItem;
//   final ValueChanged<MenuItem>? onselectedItem;
//   const MenuPage({
//     Key? key,
//     required this.currentItem,
//     this.onselectedItem,
//   }) : super(key: key);

//   @override
//   State<MenuPage> createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData.dark(),
//       child: Scaffold(
//         backgroundColor: Colors.indigo,
//         body: SafeArea(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Spacer(),
//             ...Menuitems.all.map(BuildMenuItem).toList(),
//             Spacer()
//           ],
//         )),
//       ),
//     );
//   }

//   Widget BuildMenuItem(MenuItem item) => ListTile(
//         minLeadingWidth: 20,
//         leading: Icon(item.icon),
//         title: Text(item.title),
//         onTap: () {},
//       );
// }
