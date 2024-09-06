import 'package:flutter/material.dart';
import 'package:mediconnect/screens/patient_screens/prescriptions/prescriptions_page/prescriptions_page.dart';

import '../../screens/patient_screens/home/home_page/home_page.dart';
import '../../screens/patient_screens/notifications/notification_page/Notification_page.dart';
import '../../screens/patient_screens/profile/profile_page/profile_page.dart';
import '../../screens/patient_screens/search/search_page/search_page.dart';

class PatientBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PatientBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_sharp),
            label: 'Prescriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromRGBO(41, 145, 168, 1),
        onTap: (Index) {
          onTap(Index);
          switch (Index) {
            // case 0:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => PrescriptionScreen()),
            //   );
            //   break;
            // case 1:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => SearchDoctor()),
            //   );
            //   break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            // case 3:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Notifications()),
            //   );
            //   break;
            // case 4:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ProfileScreen()),
            //   );
            //   break;
          }
        });
  }
}

