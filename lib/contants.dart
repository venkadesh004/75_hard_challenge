import 'package:flutter/material.dart';

Color background = Color.fromRGBO(5, 16, 58, 1); // Container Background
double percentCompleted = 80;

Color c1 = Color.fromRGBO(16, 28, 67, 1); // Light opacity dark blue Background
Color c2 = Color.fromRGBO(65, 197, 225, 1); // Light Text
Color c3 = Color.fromRGBO(75, 80, 112, 1); // Blue Color
Color c4 = Color.fromRGBO(146, 227, 245, 1); // Check Box Color
Color c5 = Color.fromRGBO(40, 50, 86, 1); // Check Box Normal Color

int day = 10;

List<bool> todayWork = [
  false,
  false,
  false,
  false,
  false
];

double height = 550;

List<String> headings = [
  "Selfie Task",
  "Drinking Water",
  "Reading",
  "Diet Plan",
  "Workout"
];

List<String> bio = [
  "To Take a Image of yourself and upload it.",
  "Should Drink 4 litres of Water per Day.",
  "Reading 10 pages a Day. It should be non fictional.",
  "Follow a diet plan, No Alcohol and No Cheat Days.",
  "Should Do a minimum of 45 minutes of workout."
];

List<String> images = [
  "camera-icon",
  "drop-icon",
  "book-icon",
  "diet-icon",
  "workout-icon"
];

var completedDays = [
  ["1", "https://picsum.photos/id/237/200/300", "It was a amazing Day"],
  ["2", "https://picsum.photos/id/237/200/300", "It was hard but I managed It"],
  ["3", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["4", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["5", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["6", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["7", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["8", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["9", "https://picsum.photos/id/237/200/300", "Today i was just fainted"],
  ["10", "https://picsum.photos/id/237/200/300", "Today i was just fainted"]
];

var openIndexes = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];