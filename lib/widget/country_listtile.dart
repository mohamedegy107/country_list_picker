import 'package:xcountry/models/country.dart';
import 'package:flutter/material.dart';
import '../models/dialog_theme.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile({
    Key? key,
    required this.country,
    required this.dialogTheme,
    this.isLastpick = false,
  }) : super(key: key);

  final Country country;
  final bool isLastpick;
  final CDialogTheme dialogTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dialogTheme.rowHeight,
      child: ListTile(
          leading: (dialogTheme.isShowFlage) ? Image.asset(country.flagUri!, package: 'xcountry', width: 30.0) : null,
          title: Text(
            country.englishName!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: isLastpick
                ? Icon(
                    dialogTheme.lastPickIcon.icon,
                    color: (dialogTheme.lastPickIcon.color) ?? Theme.of(context).primaryColor,
                    size: dialogTheme.lastPickIcon.size,
                  )
                : (dialogTheme.isShowDialCode)
                    ? Text(country.dialCode!,
                        style: dialogTheme.textStyle.copyWith(fontSize: dialogTheme.textStyle.fontSize ?? 16))
                    : null,
          ),
          onTap: () {
            Navigator.pop(context, country);
          }),
    );
  }
}
