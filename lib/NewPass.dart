
import 'package:flutter/material.dart';
import 'product_info.dart';

class NewPass extends StatefulWidget {
  const NewPass({ Key? key }) : super(key: key);

  @override
  _NewPassState createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {

  late String? password; 

  GlobalKey<FormState> _globalKey3 = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reinitialiser le mot de passe"),
      ),
      body: Form(
        key: _globalKey3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Image.asset("assets/images/fifa.jpg"),
              SizedBox(
                height : 20
              ),
              TextFormField(
                onSaved: (value){
                  password = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Username ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username"),
              ),
              SizedBox(
                height : 20
              ),
              ElevatedButton(
                onPressed:(){
                  if (_globalKey3.currentState!.validate()) {
                        _globalKey3.currentState!.save();
                        String message =
                            'nPassword = $password';
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Information'),
                              content: Text(message),
                              actions: [
                                TextButton(onPressed: (){

                                }, child: Text('Got it'))
                              ],
                            );
                          },
                        );
                      }
                }, 
                child: Text("Set new Password"))

            ],
          ),
        ),
      ),
      
    );
  }
}