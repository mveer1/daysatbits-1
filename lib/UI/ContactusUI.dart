import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'AboutusUI.dart';

class ContactUsUI extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  _submitform() async {
    final String _form =
        'https://docs.google.com/forms/d/e/1FAIpQLSc4qp8RABQEyrtVXT6ZfIdfZbUgEUM7X7BJAcSgdpVVncqBTg' +
            '/viewform?usp=pp_url' +
            '&entry.1652358000=' +
            _nameController.text +
            '&entry.1065594283=' +
            _emailController.text +
            '&entry.296034823=' +
            _subjectController.text +
            '&entry.40522245=' +
            _feedbackController.text;
    try {
      await launch(_form);
    } catch (e) {
      throw 'Could not submit';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'For your days at BITS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300, // light
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsUI()));
              })
        ],
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Contact Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                  ),
                  new TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter your email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new TextFormField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.subject),
                      labelText: 'Subject',
                    ),
                  ),
                  new TextFormField(
                    maxLines: 2,
                    controller: _feedbackController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.message),
                      labelText: 'Feedback',
                    ),
                  ),
                  RaisedButton(
                    child: Text('Send'),
                    color: Colors.orange[500],
                    onPressed: _submitform,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
