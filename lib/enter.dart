import 'package:flutter/material.dart';
import 'model.dart';
// import 'package:flutter/src/material/raised_button.dart';

class EntryForm extends StatefulWidget {
  final Model client;

  EntryForm(this.client);

  @override
  EntryFormState createState() => EntryFormState(this.client);
}

class EntryFormState extends State<EntryForm> {
  Model client;

  EntryFormState(this.client);

  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController storeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (client != null) {
      nicknameController.text = client.nickname;
      emailController.text = client.email;
      storeController.text = client.store;
      phoneController.text= client.phone; 
    }
    return Scaffold(
      appBar: AppBar(
        title: client == null ? Text('Add', textScaleFactor: 1.1) : Text('Edit', textScaleFactor: 1.1),
        leading: Icon(Icons.keyboard_arrow_left),        
        ),
              
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget> [
            Padding (
              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: TextField(
                controller: nicknameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nickname',
                  border: OutlineInputBorder (
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: TextField(                                
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder (
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: TextField(                                
                controller: storeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Store Name',                  
                  border: OutlineInputBorder (
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',                  
                  border: OutlineInputBorder (
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding (
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: (
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,                                            
                        ),
                      child: Text(
                        'Save',
                        textScaleFactor: 1.2,
                        ),
                      onPressed: () { 
                        if (client == null) {
                          client = Model(
                            nicknameController.text,
                            emailController.text, 
                            storeController.text, 
                            phoneController.text
                          );
                        } else{
                          client.nickname = nicknameController.text;
                          client.email = emailController.text;
                          client.store = storeController.text;
                          client.phone = phoneController.text;
                        }
                        Navigator.pop(context, client);
                      },
                    ) 
                  ),
                ),
                  Container(width: 5.0),
                    Expanded(
                      child: (
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,                                            
                          ),
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.2,
                          ),
                        onPressed: () {                           
                          Navigator.pop(context);
                        },
                      )
                    ),
                  )
                ],
              )
            )
          ]
        ),
      ),
    );
  }
}