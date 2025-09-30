import 'package:flutter/material.dart';

class LocationDropdown extends StatefulWidget {
  const LocationDropdown({Key? key}) : super(key: key);

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  final List<String> cities = [
    "Cairo",
    "Alexandria",
    "Giza",
    "Luxor",
    "Aswan",
    "Mansoura",
    "Tanta",
    "Ismailia",
  ];

  String selectedCity = "Alexandria"; // default

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.white70, size: 18),
        const SizedBox(width: 4),
        DropdownButton<String>(
          dropdownColor: Colors.white,
          value: selectedCity,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          underline: const SizedBox(),
          style: const TextStyle(color: Colors.white, fontSize: 14),
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue!;
            });
          },
          items: cities.map<DropdownMenuItem<String>>((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(
                city,
                style: const TextStyle(color: Colors.black), // dropdown list text
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
