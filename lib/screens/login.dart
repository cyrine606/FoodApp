import 'package:flutter/material.dart';
import 'package:food/screens/Splash.dart';
import 'package:food/screens/home.dart';
import 'package:food/screens/signup.dart';
import 'package:food/provider/userProvider.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context){
    //final user = Provider.of<UserProvider>(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _Key,
        backgroundColor: Colors.white,
        body: /*user.status == Status.Authenticating?Splash():*/Stack(
          children: [
            Container(
              height: double.infinity,
              child: Image.asset("android/images2/background.jpg",
                fit:BoxFit.fill,
              ),
            ),
            Container(
              height: double.infinity,
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset("android/images2/logo.png",
                          fit:BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14,8,14.0,8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.7),
                                  elevation: 0.0,
                                  child: Container(
                                    height: 53.0,
                                    child:Padding(
                                    padding: const EdgeInsets.only(left: 22.0,top: 2),
                                      child: TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        controller: _emailTextController,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          icon: Icon (Icons.email,size: 20,),border: InputBorder.none,
                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            /*Pattern pattern =
                                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                RegExp regex = new RegExp(pattern);
                                                if (!regex.hasMatch(value))*/
                                            return 'Please make sure your email adress is valid';}
                                          else{
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0,8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.7),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Container(
                                      height: 53,
                                      child: ListTile(
                                        title: TextFormField(
                                          obscureText: hidePass,
                                          controller: _passwordTextController,
                                          decoration: InputDecoration(
                                            hintText: "password",
                                            icon: Icon (Icons.lock_outline,size: 20,),border: InputBorder.none,
                                          ),
                                          validator: (value){
                                            if (value.isEmpty){
                                              return "The password field cannot be empty";
                                            }else if (value.length < 6){
                                              return "The password has to be at least 6 characters long";
                                            }else {
                                              return null;
                                            }
                                          },
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(
                                              Icons.remove_red_eye,size: 20),
                                          onPressed: () {
                                            setState(
                                                    () {
                                                  hidePass = false;
                                                });
                                          },),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(14.0, 20.0, 14.0,10.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.deepOrangeAccent,
                                  elevation: 0.0,
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    onPressed:(){},/* ()async{
                                      if(_formKey.currentState.validate()){
                                        if (!(await user.signIn(_emailTextController.text,_passwordTextController.text))){
                                          _Key.currentState.showSnackBar(SnackBar(content: Text("Sign in Failed"),));
                                        }
                                      }
                                    },*/
                                    child: Text("Login", textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,
                                          fontSize: 20.0
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text("Login with Google",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blueAccent,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sign()));},
                                  child: Text("Create an Account",textAlign: TextAlign.center,style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 19.0, color: Colors.deepOrange),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /* Visibility (
                      visible: loading ?? true,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white.withOpacity(0.8),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),),
    );

  }
}