
import 'package:flutter/material.dart';
import 'product_info.dart';

class Auth extends StatefulWidget {
  const Auth({ Key? key }) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  late String? username;
  late String? password; 

  GlobalKey<FormState> _globalKey2 = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: Form(
        key: _globalKey2,
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
                  username = value;
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
              TextFormField(
                obscureText: true,
                onSaved: (value){
                  password = value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Password ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password"),
              ),
              SizedBox(
                height : 20
              ),
              ElevatedButton(
                onPressed:(){
                  if (_globalKey2.currentState!.validate()) {
                        _globalKey2.currentState!.save();
                        String message =
                            'Username = $username \nPassword = $password';
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
                child: Text("S'authentifier")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red),
                onPressed:(){}, 
                child: Text("Cree un compte")
                ),
                SizedBox(
                height : 20
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mot de passe oublier ?"),
                    Text("Cliquez ici",style: TextStyle(color: Colors.blue),)
                  ],
                )
            ],
          ),
        ),
      ),
      
    );
  }
}