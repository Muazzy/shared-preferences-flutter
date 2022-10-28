import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_lab/custom_formfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String studentName = '';
  String rollNo = '';
  String age = '';

  @override
  void initState() {
    loadStudent();
    super.initState();
  }

  void loadStudent() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      studentName = preferences.getString('name') ?? 'student name';
      rollNo = preferences.getString('rollNo') ?? 'roll no';
      age = preferences.getString('age') ?? '0';
    });
  }

  void setData(variable, value, key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      variable = value;
      preferences.setString(key, value);
      // variable = preferences.setString(value)
    });
  }

  void setDataInt(variable, value, key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      variable = value;
      preferences.setInt(key, value);
      // variable = preferences.setString(value)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Lab'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(studentName),
            const SizedBox(height: 16),
            Text(rollNo),
            const SizedBox(height: 16),
            Text(age.toString()),
            const SizedBox(height: 16),
            CustomFormField(
              onChanged: (s) {
                setData(studentName, s, 'name');
              },
              labelText: 'student name',
              isPassword: false,
              validatorFunction: (b) {},
              primaryColor: Colors.deepPurple,
              textColor: Colors.black,
            ),
            const SizedBox(height: 16),
            CustomFormField(
              onChanged: (s) {
                setData(rollNo, s, 'rollNo');
              },
              labelText: 'Roll number',
              isPassword: false,
              validatorFunction: (b) {},
              primaryColor: Colors.deepPurple,
              textColor: Colors.black,
            ),
            const SizedBox(height: 16),
            CustomFormField(
              onChanged: (s) {
                setData(age, s, 'age');
              },
              labelText: 'age',
              isPassword: false,
              validatorFunction: (b) {},
              primaryColor: Colors.deepPurple,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
