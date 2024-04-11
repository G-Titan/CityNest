// ignore: file_names
// ignore_for_file: library_private_types_in_public_api

import 'package:citynest/conf/CloudSync.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Persona extends StatefulWidget {
  const Persona({super.key});

  @override
  _PersonaState createState() => _PersonaState();
}

class _PersonaState extends State<Persona> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _homeAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _citizenshipController = TextEditingController();
  bool _isMale = false;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KYC, Terms & Conditions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registration Phase 1/3'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _surnameController,
                  decoration: const InputDecoration(labelText: 'Surname'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _idNumberController,
                  decoration: const InputDecoration(labelText: 'ID Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ID number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _homeAddressController,
                  decoration: const InputDecoration(labelText: 'Home Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your home address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _citizenshipController,
                  decoration: const InputDecoration(labelText: 'Citizenship'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your citizenship';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    const Text('Gender:'),
                    const SizedBox(width: 10),
                    DropdownButton<bool>(
                      value: _isMale,
                      onChanged: (bool? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _isMale = newValue;
                          });
                        }
                      },
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('Female'),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Birthday:'),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Extract user data from the form fields
                      String name = _nameController.text;
                      String surname = _surnameController.text;
                      int age = int.parse(_ageController.text);
                      String idNumber = _idNumberController.text;
                      String homeAddress = _homeAddressController.text;
                      String phoneNumber = _phoneNumberController.text;
                      String citizenship = _citizenshipController.text;
                      String gender = _isMale ? 'Male' : 'Female';
                      String birthDate = _selectedDate != null
                          ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                          : '';

                      // Call CloudSync method to register user details
                      CloudSync.registerUserDetails(
                        context,
                        FirebaseAuth.instance.currentUser!.uid,
                        name,
                        surname,
                        age,
                        idNumber,
                        homeAddress,
                        phoneNumber,
                        citizenship,
                        gender,
                        birthDate,
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
