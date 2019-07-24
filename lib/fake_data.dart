import 'package:flutter/material.dart';
import 'package:simple_weather/widgets/hourly_item.dart';

final List<dynamic> hourlyDatas = [
  {
    "icon": "🌤",
    "time": "8:00 AM",
    "temp": "16°",
  },
  {
    "icon": "🌤",
    "time": "9:00 AM",
    "temp": "18°",
  },
  {
    "icon": "🌤",
    "time": "10:00 AM",
    "temp": "19°",
  },
  {
    "icon": "🌤",
    "time": "11:00 AM",
    "temp": "20°",
  },
  {
    "icon": "☀️",
    "time": "12:00 AM",
    "temp": "21°",
  },
  {
    "icon": "☀️",
    "time": "1:00 PM",
    "temp": "23°",
  },
  {
    "icon": "☀️",
    "time": "2:00 PM",
    "temp": "23°",
  },
  {
    "icon": "☀️",
    "time": "3:00 PM",
    "temp": "24°",
  },
  {
    "icon": "☀️",
    "time": "4:00 PM",
    "temp": "23°",
  },
  {
    "icon": "🌤",
    "time": "5:00 pM",
    "temp": "22°",
  },
];

class FakeData {
  static List<Widget> buildHourlyData() {
    return hourlyDatas.map((data) {
      return HourlyItem(
        iconText: data["icon"],
        time: data["time"],
        temperature: data["temp"],
      );
    }).toList();
  }
}
