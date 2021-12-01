
import 'package:flutter/material.dart';
import 'product_info.dart';

class Param extends StatefulWidget {
  const Param({ Key? key }) : super(key: key);

  @override
  _ParamState createState() => _ParamState();
}

class _ParamState extends State<Param> {

  late String? CurrentPassword; 
  late String? NewPassword; 
  late String? Adress; 

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
                  CurrentPassword = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Password actuel ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Current Password"),
              ),
              SizedBox(
                height : 20
              ),
              TextFormField(
                onSaved: (value){
                  NewPassword = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'le nouveau Password ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "New Password"),
              ),
              SizedBox(
                height : 20
              ),
              TextFormField(
                maxLines: 4,
                onSaved: (value){
                  NewPassword = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "L'adresse de facturation ne doit pas etre vide";
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse"),
              ),
              SizedBox(
                height : 20
              ),
              ElevatedButton(
                onPressed:(){
                  if (_globalKey3.currentState!.validate()) {
                        _globalKey3.currentState!.save();
                        String message =
                            'nPassword = $NewPassword/Adresse = $Adress';
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Informations'),
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
                child: Text("Enregistrer"))

            ],
          ),
        ),
      ),
      
    );
  }
}