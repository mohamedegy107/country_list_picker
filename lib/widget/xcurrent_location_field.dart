import 'package:flutter/material.dart';
import '../widget/xtitle.dart';
import '../models/country.dart';
import '../models/dialog_theme.dart';
import './country_listtile.dart';

class XCurrentLocationField extends StatelessWidget {
  const XCurrentLocationField({
    Key? key,
    required this.dialogTheme,

    required this.countries
  }) : super(key: key);

  final CDialogTheme dialogTheme;

  final List<Country> countries;

  @override
  Widget build(BuildContext context) {
    Country country = countries.singleWhere((element) => element.code == WidgetsBinding.instance.window.locale.countryCode);
    return Column(children: [
      XTitle(
          title: dialogTheme.currentLocationText,
          background: dialogTheme.titlesBackground,
          titlesStyle: dialogTheme.titlesStyle,
          height: dialogTheme.rowHeight),
      CountryListTile(country: country, dialogTheme: dialogTheme),
    ]);
  }
}
