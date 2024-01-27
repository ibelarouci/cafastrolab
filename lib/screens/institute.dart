import 'package:cafastrolab/providers/instituteModel.dart';

import 'package:cafastrolab/widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstituteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InstituteModel(),
      child: Scaffold(
        drawer: NavDrawer(accountName: 'Your Account Name'),
        appBar: AppBar(
          title: Text('Institute List'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<InstituteModel>(
                builder: (context, model, child) {
                  return TextField(
                    controller: model.searchController,
                    onChanged: (value) {
                      model.filterInstitutes(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Consumer<InstituteModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    itemCount: model.filteredInstitutes.length,
                    itemBuilder: (context, index) {
                      final institute = model.filteredInstitutes[index];
                      return ListTile(
                        title: Text(institute.nm),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(institute.adr + " " + institute.wl)],
                        ),
                        // Add more details as needed
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'dart:convert'; // Import for JSON decoding
import 'package:flutter/services.dart' show rootBundle;
import 'package:cafastrolab/navDrawer.dart';
import 'package:flutter/material.dart';

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

class InstituteListScreen extends StatefulWidget {
  @override
  _InstituteListScreenState createState() => _InstituteListScreenState();
}

class _InstituteListScreenState extends State<InstituteListScreen> {
  List<Institute> institutes = [];
  TextEditingController searchController = TextEditingController();
  List<Institute> filteredInstitutes = [];

  @override
  void initState() {
    super.initState();
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

    setState(() {
      institutes = parsedInstitutes;
      filteredInstitutes = parsedInstitutes;
    });
  }

  void filterInstitutes(String query) {
    final filteredList = institutes
        .where((institute) =>
            institute.nm.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredInstitutes = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(accountName: 'Your Account Name'),
      appBar: AppBar(
        title: Text('Institute List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterInstitutes(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredInstitutes.length,
              itemBuilder: (context, index) {
                final institute = filteredInstitutes[index];
                return ListTile(
                  title: Text(institute.nm),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(institute.adr + " " + institute.wl)],
                  ),
                  // Add more details as needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/