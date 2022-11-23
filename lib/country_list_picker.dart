library country_list_picker;

import 'package:country_list_picker/models/csettings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './selection_list.dart';
import './models/country.dart';
import './support/countries_codes_en.dart';
import './support/countries_codes_local.dart';
import './models/dialog_theme.dart';
import './models/picker_theme.dart';

class CountryListPicker extends StatefulWidget {
  const CountryListPicker({
    super.key,
    this.onChanged,
    this.initialSelection,
    this.appBar,
    this.pickerBuilder,
    this.countryBuilder,
    this.pickerTheme,
    this.dialogTheme = const CDialogTheme(),
    this.width,
    this.useUiOverlay = false,
    this.useSafeArea = false,
  });

  final String? initialSelection;
  final ValueChanged<Country?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, Country? countryCode)? pickerBuilder;
  final CPickerTheme? pickerTheme;
  final CDialogTheme dialogTheme;
  final Widget Function(BuildContext context, Country? country)? countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;
  final double? width;

  @override
  CountryListPickerState createState() {
    return CountryListPickerState();
  }
}

class CountryListPickerState extends State<CountryListPicker> {
  Country? selectedItem;
  List<Country> elements = [];
  @override
  void initState() {
    elements = (widget.pickerTheme?.showEnglishName ?? true ? countriesEnglish : codes)
        .map((s) => Country(
              englishName: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              length: s['length'],
              flagUri: 'flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code!.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
              (e.dialCode == widget.initialSelection),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen() async {
    final Country? result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CSettings>(
            create: (context) => CSettings(),
            child: SelectionList(
              elements,
              initialSelection: selectedItem,
              appBar: widget.dialogTheme.appBar ??
                  AppBar(
                      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                      title: const Text("Select your country")),
              pickerTheme: widget.pickerTheme,
              dialogTheme: widget.dialogTheme,
              dialogBuilder: widget.countryBuilder,
              useUiOverlay: widget.useUiOverlay,
              useSafeArea: widget.useSafeArea,
            ),
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged!(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.greenAccent),
      width: widget.width,
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: _buildCountryCodeSelector(),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  TextButton _buildCountryCodeSelector() {
    return TextButton(
      onPressed: () {
        _awaitFromSelectScreen();
      },
      child: widget.pickerBuilder != null
          ? widget.pickerBuilder!(context, selectedItem)
          : Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (widget.pickerTheme?.isShowFlag ?? true == true)
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(selectedItem!.flagUri!, package: "country_list_picker", width: 32.0)),
                  ),
                if (widget.pickerTheme?.isShowCode ?? true == true)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(selectedItem.toString(), style: widget.pickerTheme?.codeTextStyle),
                    ),
                  ),
                if (widget.pickerTheme?.isShowTitle ?? true == true)
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(selectedItem!.toCountryStringOnly(), maxLines: 1, overflow: TextOverflow.ellipsis)),
                  ),
                if (widget.pickerTheme?.isDownIcon ?? true == true)
                  const Flexible(
                    child: Icon(Icons.keyboard_arrow_down),
                  )
              ],
            ),
    );
  }
}
