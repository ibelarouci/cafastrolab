import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Institute {
  final String nu;
  final String Id;
  final String Id_w;
  final String wl;
  final String nm;
  final String tp;
  final String tl;
  final String fx;
  final String adr;
  final String eml;
  final String ic;
  final String ac;
  final String rc;

  Institute({
    required this.nu,
    required this.Id,
    required this.Id_w,
    required this.wl,
    required this.nm,
    required this.tp,
    required this.tl,
    required this.fx,
    required this.adr,
    required this.eml,
    required this.ic,
    required this.ac,
    required this.rc,
  });
}

class InstituteModel extends ChangeNotifier {
  List<Institute> institutes = [];
  TextEditingController searchController = TextEditingController();
  List<Institute> filteredInstitutes = [];

  InstituteModel() {
    loadInstitutesFromAsset();
  }

  Future<void> loadInstitutesFromAsset() async {
    final jsonString =
        await rootBundle.loadString('assets/institutions_directory.json');
    final jsonResponse = json.decode(jsonString);

    List<Institute> parsedInstitutes = [];
    for (var item in jsonResponse) {
      parsedInstitutes.add(Institute(
        nu: item['nu'],
        Id: item['Id'],
        Id_w: item['Id_w'],
        wl: item['wl'],
        nm: item['nm'],
        tp: item['tp'],
        tl: item['tl'],
        fx: item['fx'],
        adr: item['adr'],
        eml: item['eml'],
        ic: item['ic'],
        ac: item['ac'],
        rc: item['rc'],
      ));
    }
    institutes = parsedInstitutes;
    filteredInstitutes = parsedInstitutes;

    notifyListeners();
  }

  void filterInstitutes(String query) {
    final filteredList = institutes
        .where((institute) =>
            institute.nm.toLowerCase().contains(query.toLowerCase()))
        .toList();

    filteredInstitutes = filteredList;

    notifyListeners();
  }
}
