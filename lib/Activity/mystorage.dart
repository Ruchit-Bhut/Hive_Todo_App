// ignore_for_file: public_member_api_docs, use_build_context_synchronously, inference_failure_on_instance_creation

import 'package:data_store/Activity/display_details.dart';
import 'package:data_store/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1b5e20),
          title: const Text(
            'Form',
            style: TextStyle(
              color: Color(0xffc8e6c9),
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Color(
                        0xff1b5e20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name !';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.green[900],
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green.shade900,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'name',
                        labelStyle: TextStyle(
                          color: Colors.green[900],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green.shade900,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            name.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.green[900],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await box.add(name.text);
                    final values = List.from(box.values);
                    await Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          name: values.toString(),
                        ),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: Container(
                  width: 150,
                  height: 50,
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
                  child: Center(
                    child: Text(
                      'submit',
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
