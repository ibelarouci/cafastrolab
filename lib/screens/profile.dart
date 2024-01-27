import 'package:cafastrolab/providers/profileModel.dart';
import 'package:cafastrolab/widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class Grade {
  final String code;
  final String name;

  Grade({
    required this.code,
    required this.name,
  });
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String institution = '';
  String selectedGrade = ''; // Store the selected grade code
  String age = '';
  String gender = '';
  List<Grade> grades = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Grade>> loadGradesFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/grades.json');
    final jsonResponse = json.decode(jsonString);

    List<Grade> parsedGrades = [];
    for (var item in jsonResponse) {
      parsedGrades.add(Grade(
        code: item['code'],
        name: item['name'],
      ));
    }

    return parsedGrades;
  }

  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileModel>(context, listen: true);
    return FutureBuilder(
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            grades = snapshot.data as List<Grade>;

            print(grades.length);
            return Scaffold(
              drawer: NavDrawer(accountName: 'Your Account Name'),
              appBar: AppBar(
                title: Text('Profile'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Institution',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(onChanged: (value) {
                      profileModel.updateInstitution(value);
                    }),
                    // ... (previous code for 'Institution' TextField)

                    SizedBox(height: 20),

                    Text(
                      'Grade',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      value: profileModel.selectedGrade.isNotEmpty
                          ? profileModel.selectedGrade
                          : null,
                      onChanged: (value) {
                        profileModel.updateSelectedGrade(value!);
                      },
                      items: grades.map((grade) {
                        return DropdownMenuItem<String>(
                          value: grade.code,
                          child: Text(grade.name),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20),

                    Text(
                      'Age',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(onChanged: (value) {
                      profileModel.updateAge(value);
                    }),
                    // ... (previous code for 'Age' TextField)

                    SizedBox(height: 20),

                    Text(
                      'Gender',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextField(onChanged: (value) {
                      profileModel.updateGender(value);
                    }),
                    // ... (previous code for 'Gender' TextField)

                    SizedBox(height: 30),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Access the profile data using profileModel
                          print('Institution: ${profileModel.institution}');
                          print('Grade: ${profileModel.selectedGrade}');
                          print('Age: ${profileModel.age}');
                          print('Gender: ${profileModel.gender}');
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularProgressIndicator(),
        );
      },

      // Future that needs to be resolved
      // inorder to display something on the Canvas
      future: loadGradesFromAsset(),
    );
  }
}
