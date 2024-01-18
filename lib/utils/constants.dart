import 'package:flutter/material.dart';

class Constants {
  static double width = 0;
  static double height = 0;
  static String imageUrl =
      "https://imgs.search.brave.com/7rePbPfCq5alu4J6s-lFHhhaLcATiEfDhlJbNIb8jLo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9k/YXJrLWFic3RyYWN0/LXRleHR1cmVfMTAx/Ny01Nzg4LmpwZz9z/aXplPTYyNiZleHQ9/anBn";
}

setSize(BuildContext context) {
  Constants.height = MediaQuery.of(context).size.height;
  Constants.width = MediaQuery.of(context).size.width;
}

const kHight5 = SizedBox(height: 5);
const kHight10 = SizedBox(height: 10);
const kHight20 = SizedBox(height: 20);
const kHight30 = SizedBox(height: 30);
const kHight50 = SizedBox(height: 50);
const kHight100 = SizedBox(height: 100);

const kWidth10 = SizedBox(width: 10);
const kWidth20 = SizedBox(width: 20);
const kWidth50 = SizedBox(width: 50);

const divider1 = Divider(thickness: 1, color: Colors.black);
const divider2 = Divider(thickness: 2, color: Colors.grey);
const divider5 = Divider(thickness: 5, color: Colors.black);
