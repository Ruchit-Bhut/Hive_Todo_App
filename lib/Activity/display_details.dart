// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs, inference_failure_on_function_invocation, non_constant_identifier_names, inference_failure_on_instance_creation

import 'package:data_store/Activity/mystorage.dart';
import 'package:data_store/main.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
    this.name = '',
  }) : super(key: key);

  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Future<void> ClearData(int index) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            children: [
              Text('Alert !!'),
            ],
          ),
          content: const Text('Are You Sure Delete This note ?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  box.deleteAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> editItem(int index, dynamic currentValue) async {
    final editname = TextEditingController(text: currentValue.toString());

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: TextFormField(
            controller: editname,
            decoration: const InputDecoration(labelText: 'New Value'),
            validator: (newValue) {
              if (newValue!.isEmpty) {
                return 'Please enter a value.';
              }
              return null;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (editname.text.isNotEmpty) {
                  setState(() {
                    box.putAt(index, editname.text);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    box.get(box.values);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text(
          'Second Page',
          style: TextStyle(
            color: Color(0xffc8e6c9),
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        backgroundColor: const Color(0xffc8e6c9),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.green,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            final value = box.values.elementAt(index);
            return ListTile(
              title: Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green.shade100,
                      Colors.green.shade200,
                      Colors.green.shade400,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        value.toString(), // Convert to string
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                editItem(index, value);
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.green.shade900,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ClearData(index);
                                // box.clear();
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.green.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
