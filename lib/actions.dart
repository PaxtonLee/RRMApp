import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


int _value = 1;
List<String> _preferences = [];

DropdownMenuItem addItem(int n, String text) {
  return DropdownMenuItem(
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
    value: n,
  );
}

int getValue() {return _value;}

List<String> getPrefs() {
  return _preferences;
}


void doAction1() {
  switch (_value) {
    case 1:
      {
        _preferences.add("Breakfast");
      }
      break;
    case 2:
      {
        _preferences.add("Lunch");
      }
      break;
    case 3:
      {
        _preferences.add("Dinner");
      }
      break;
    case 4:
      {
        _preferences.add("Snack");
      }
      break;
  }
}

void doAction2() {}

void doAction3() {}

void findRecipe(List prefs) {
  String search = "";
  for (int i = 0; i < prefs.length; i++) {
    search = search + prefs[i];
  }
  _launchURL(search);
}

_launchURL(String address) async {
  String url = address;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }

}