import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Card Generator'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              MyStudent(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStudent extends StatefulWidget {
  const MyStudent({super.key});

  @override
  State<MyStudent> createState() => _MyStudentState();
}

class _MyStudentState extends State<MyStudent> {
  String gender = '';
  bool check = false;
  bool showCard = false;
  String regNumber = '';
  String name = '';
  String email = '';
  String course = '';

  final TextEditingController regNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: regNumberController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              labelText: 'Registration Number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.name,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              labelText: 'Names',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: courseController,
            keyboardType: TextInputType.name,
            style: const TextStyle(
              fontSize: 12,
            ),
            decoration: const InputDecoration(
              labelText: 'Course(e.g, IT)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          CheckboxListTile(
            value: check,
            onChanged: (bool? value) {
              setState(() {
                check = value ?? false;
              });
            },
            title: const Text("Is NSFAS Beneficiary?"),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: const Text('Gender', style: TextStyle(fontSize: 12)),
          ),
          RadioListTile(
            title: const Text('Male'),
            value: 'Male',
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text('Female'),
            value: 'Female',
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                regNumber = regNumberController.text;
                email = emailController.text;
                course = courseController.text;
                showCard = true;
                name = nameController.text;
              });
            },
            child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
          if (showCard)
            StudentCard(
              regNumber: regNumber,
              email: email,
              name: name,
              course: course,
              nsfasStatus: check ? 'Yes' : 'No',
              gender: gender,
            ),
        ],
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final String regNumber;
  final String name;
  final String email;
  final String course;
  final String nsfasStatus;
  final String gender;

  const StudentCard({
    super.key,
    required this.regNumber,
    required this.name,
    required this.email,
    required this.course,
    required this.nsfasStatus,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Student Card',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Icon(
              Icons.person_4_rounded,
              size: 100,
              color: Colors.black,
            ),
            const Divider(),
            Text(
              'RegNo: $regNumber',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Name: $name',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Email: $email',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Course: $course',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NSFAS Beneficiary: $nsfasStatus',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Gender: $gender',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
