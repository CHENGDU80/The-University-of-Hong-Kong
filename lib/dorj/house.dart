import 'package:chengdu80_prototype/color.dart';
import 'package:chengdu80_prototype/dorj/claim.dart';
import 'package:chengdu80_prototype/dorj/manage.dart';
import 'package:flutter/material.dart';

class House extends StatefulWidget {
  const House({super.key});

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {
  int index = 1;
  List<Widget> states = [const Management(), const Management(), const Claim()];
  List<String> sideTitles = [
    "Home",
    "Underwrite",
    "Claim",
    "Settings",
    "Profile"
  ];
  List<IconData> sideIcons = [
    Icons.home,
    Icons.piano,
    Icons.monetization_on,
    Icons.settings,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Container(
            width: 250,
            color: MyColors.primary,
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                  child: Center(
                    child: Text(
                      "Admin Panel",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                for (int i = 0; i < sideTitles.length; i++)
                  Container(
                    decoration: BoxDecoration(
                        color: index == i ? MyColors.secondary : null),
                    child: ListTile(
                      leading: Icon(
                        sideIcons[i],
                        color: Colors.white,
                      ),
                      title: Text(
                        sideTitles[i],
                        style: const TextStyle(color: Colors.white),
                      ),
                      minVerticalPadding: 20,
                      onTap: () {
                        setState(() {
                          if (i > 0 && i < 3) index = i;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
                child: Row(
                  children: [
                    SizedBox(width: 50),
                    SizedBox(height: 40, width: 600, child: MySearchBar())
                  ],
                ),
              ),
              Expanded(child: states[index]),
            ],
          ))
        ],
      ),
    );
  }
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.primary.withOpacity(0.1),
      ),
      child: const Row(
        children: <Widget>[
          Icon(Icons.search),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
