// ignore: file_names
// ignore_for_file: library_private_types_in_public_api

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
                      // If the form is valid, submit the data.
                      // You can process the data here as per your requirement
                      // For example, you can print the values of the fields
                      print('Name: ${_nameController.text}');
                      print('Surname: ${_surnameController.text}');
                      print('Age: ${_ageController.text}');
                      print('ID Number: ${_idNumberController.text}');
                      print('Home Address: ${_homeAddressController.text}');
                      print('Phone Number: ${_phoneNumberController.text}');
                      print('Citizenship: ${_citizenshipController.text}');
                      print('Gender: ${_isMale ? 'Male' : 'Female'}');
                      print('Birthday: $_selectedDate');
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
