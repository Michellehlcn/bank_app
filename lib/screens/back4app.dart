import 'package:flutter/material.dart';
import 'package:flutter_bank_app/data/contact.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Back4app extends StatefulWidget {
  const Back4app({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar());
  // }

  @override
  // ignore: library_private_types_in_public_api
  _ContactsAppState createState() => _ContactsAppState();
}

class _ContactsAppState extends State<Back4app> {
  List<Contact> contacts = [];
  String? selectedZipCode;

  @override
  void initState() {
    super.initState();
    selectedZipCode = '1234';
    //_loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddContactDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String phoneNumber = '';
        return AlertDialog(
          title: Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              // Checkbox for zip code
              ListTile(
                title: const Text('Slect Zip Code'),
                subtitle: Column(
                  children: [
                    RadioListTile(
                      title: const Text("1234"),
                      value: '1234',
                      groupValue: selectedZipCode,
                      onChanged: (value) {
                        setState(() {
                          selectedZipCode = value;
                        });
                        print(selectedZipCode);
                      },
                    ),
                    RadioListTile( 
                      title: const Text('4321'),
                      value: '4321',
                      groupValue: selectedZipCode,
                      onChanged: (value) {
                        setState(() {
                          selectedZipCode = value;
                        });
                        print(selectedZipCode);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  contacts.add(
                    Contact(
                      name: name, 
                      phoneNumber: phoneNumber, 
                      zipCode: selectedZipCode as String
                      ));
                });

                // Save the contact to back4App 
                final contact = ParseObject('Contact');
                final zipCodeObject  = ParseObject('ZipCode')
                ..objectId = selectedZipCode as String;
                zipCodeObject.set('zipCode', selectedZipCode);
              
                contact.set('name', name);
                contact.set('phoneNumber', phoneNumber);
              
                contact.set( 'zipCode', zipCodeObject .toPointer());
                await contact.save();
                await zipCodeObject.save();

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
              },
              child: const Text('Save'),
              ),
          ],
        );
      },
    );
  }
}
