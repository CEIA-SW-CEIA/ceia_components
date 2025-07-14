import 'package:ceia_components/core/config/app_config.dart';
import 'package:ceia_components/enums/system_modules.dart';
import 'package:ceia_components/utils/routes_utils.dart';
import 'package:ceia_components/widgets/ceia_text.dart';
import 'package:flutter/material.dart';

class CeiaSelectModuleDropdown extends StatefulWidget {
  final List<SystemModules> modules;
  final SystemModules currentModule;
  final String token;
  final AppConfig appConfig;
  const CeiaSelectModuleDropdown({
    super.key,
    required this.modules,
    required this.currentModule,
    required this.token,
    required this.appConfig,
  });

  @override
  State<CeiaSelectModuleDropdown> createState() => _CeiaSelectModuleDropdownState();
}

class _CeiaSelectModuleDropdownState extends State<CeiaSelectModuleDropdown> {
  late SystemModules? _dropDownValue;
  late List<DropdownMenuItem<SystemModules>> menuOptions;
  late List<Row> selectedOptions;
  @override
  void initState() {
    _dropDownValue = widget.currentModule;

    widget.modules.remove(widget.currentModule);
    widget.modules.insert(0, widget.currentModule);

    _setupMenuOption();

    _setupSelectedOptions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        selectedItemBuilder: (BuildContext context) {
          return selectedOptions;
        },
        underline: const SizedBox(),
        isExpanded: true,
        isDense: true,
        items: menuOptions,
        icon: const SizedBox(),
        iconEnabledColor: const Color(0xFF02203E),
        onChanged: (SystemModules? selectedValue) {
          if (selectedValue != _dropDownValue) {
            setState(
              () {
                _dropDownValue = selectedValue;
                _selectModuleToRedirect(selectedValue);
              },
            );
          }
        },
        value: _dropDownValue,
      ),
    );
  }

  DropdownMenuItem<SystemModules> _buildCurrentModuleOption(SystemModules module) {
    return DropdownMenuItem<SystemModules>(
      value: module,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CEIAText.subtitleMedium(
              text: _returnModuleName(module),
              color: const Color(0xFF02203E),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          const Icon(
            Icons.check,
            size: 18,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  void _selectModuleToRedirect(SystemModules? module) {
    switch (module) {
      case SystemModules.projectModule:
        RoutesUtils.redirectToExternalPage(
            Uri.parse("${widget.appConfig.projectManagerModuleUrl}?token=${widget.token}"));

      case SystemModules.scholarShipHolderModule:
        RoutesUtils.redirectToExternalPage(
            Uri.parse("${widget.appConfig.scholarshipHolderModuleUrl}?token=${widget.token}"));

      case null:
    }
  }

  String _returnModuleName(SystemModules module) {
    switch (module) {
      case SystemModules.projectModule:
        return 'Módulo Projeto';
      case SystemModules.scholarShipHolderModule:
        return 'Módulo Bolsista';
    }
  }

  void _setupMenuOption() {
    menuOptions = widget.modules.map(
      (SystemModules value) {
        return value != widget.currentModule
            ? DropdownMenuItem<SystemModules>(
                value: value,
                child: Center(
                  child: CEIAText.subtitleMedium(
                    text: _returnModuleName(value),
                    color: const Color(0xFF02203E),
                  ),
                ),
              )
            : _buildCurrentModuleOption(value);
      },
    ).toList();
  }

  void _setupSelectedOptions() {
    selectedOptions = widget.modules.map((SystemModules value) {
      return Row(
        children: [
          const SizedBox(
            width: 4,
          ),
          CEIAText.subtitleMedium(
            text: _returnModuleName(value),
            color: const Color(0xFF02203E),
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 16,
            color: Color(0xFF02203E),
          ),
        ],
      );
    }).toList();
  }
}
