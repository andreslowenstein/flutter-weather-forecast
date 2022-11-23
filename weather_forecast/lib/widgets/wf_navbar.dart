import 'package:flutter/material.dart';

class WFNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onItemTapped;

  const WFNavBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 1,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            onItemTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
                size: 30,
              ),
              label: 'London',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
                size: 30,
              ),
              label: 'Buenos Aires',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
                size: 30,
              ),
              label: 'New York',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_support_outlined,
                size: 30,
              ),
              label: 'Contact',
              tooltip: '',
            ),
          ],
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          selectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedItemColor: Colors.grey[500],
          unselectedLabelStyle: TextStyle(
              color: Colors.grey[300],
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
