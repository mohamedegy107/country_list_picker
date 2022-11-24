import 'package:flutter/material.dart';

class CDialogTheme {
  final PreferredSizeWidget? appBar;
  final bool isShowFloatButton;
  final bool isShowDialCode;
  final bool isShowFlage;
  final TextStyle titlesStyle;
  final Color titlesBackground;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double rowHeight;
  // Search Area Area
  final bool isShowSearch;
  final String searchText;
  final String searchHintText;

  // Current Location Area
  final bool isShowCurrentLocation;
  final String currentLocationText;

  //Last Picked Country Area
  final bool isShowLastPickCountry;
  final String lastPickText;
  final Icon lastPickIcon;

  // alphabet Area
  final Color alphabetBackgroundColor;
  final TextStyle alphabetTextStyle;
  final Color alphabetSelectedBackgroundColor;
  final TextStyle alphabetSelectedTextStyle;
  final bool isShowAphabetScroll;

  const CDialogTheme({
    this.appBar,
    this.isShowFlage = true,
    this.isShowFloatButton = true,
    this.isShowAphabetScroll = true,
    this.backgroundColor = Colors.transparent,
    this.currentLocationText = "Current Location",
    this.titlesStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.titlesBackground = const Color(0xfff4f4f4),
    this.isShowDialCode = true,
    this.isShowSearch = true,
    this.searchText = "Search",
    this.searchHintText = "name/dial code...",
    this.isShowCurrentLocation = true,
    this.isShowLastPickCountry = true,
    this.lastPickText = "Last Pick",
    this.alphabetBackgroundColor = Colors.transparent,
    this.alphabetSelectedBackgroundColor = Colors.transparent,
    this.alphabetTextStyle = const TextStyle(fontSize: 12),
    this.alphabetSelectedTextStyle = const TextStyle(fontSize: 18,  fontWeight: FontWeight.bold),
    this.lastPickIcon = const Icon(Icons.check),
    this.textStyle = const TextStyle(fontSize: 16),
    this.rowHeight = 50.0
  });
}
