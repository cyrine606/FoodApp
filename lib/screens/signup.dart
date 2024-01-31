import 'package:flutter/material.dart';
import 'package:food/provider/userProvider.dart';
import 'package:food/screens/Splash.dart';
import 'package:food/screens/home.dart';
import 'package:food/screens/login.dart';
import 'package:provider/provider.dart';
class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmedPasswordTextController = TextEditingController();
  //String gender;
  //String groupValue = "male";
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserProvider>(context);
    return MaterialApp(
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
            Container(
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          "android/images2/logo.png",
                          fit: BoxFit.fill,
                        ),
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
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    10.0),
                                color: Colors.white.withOpacity(
                                    0.7),
                                elevation: 0.0,
                                child: Container(
                                  height: 53,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0),
                                    child: TextFormField(
                                      controller: _nameTextController,
                                      decoration: InputDecoration(
                                        hintText: "name",
                                        icon: Icon(
                                            Icons.person,size: 20),
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The name field cannot be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /* Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Container(
                                      color: Colors.white.withOpacity(
                                          0.3),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: ListTile(
                                              title: Text(
                                                "Male",
                                                style: TextStyle(
                                                    color: Colors.black),
                                                textAlign: TextAlign.end,),
                                              trailing: Radio(
                                                value: "male", groupValue: groupValue,
                                                onChanged: (e) =>
                                                    valueChanged(
                                                        e),),
                                            ),),
                                          Expanded(
                                            child: ListTile(
                                              title: Text(
                                                "Female",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.black),),
                                              trailing: Radio(
                                                value: "female", groupValue: groupValue,
                                                onChanged: (e) =>
                                                    valueChanged(
                                                        e),),
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),*/
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    10.0),
                                color: Colors.white.withOpacity(
                                    0.7),
                                elevation: 0.0,
                                child: Container(
                                  height: 53,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailTextController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        icon: Icon(
                                            Icons.email,size: 20),
                                        border: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          /*Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex = new RegExp(
                                                  pattern);
                                              if (!regex.hasMatch(
                                                  value))
                                                return 'Please make sure your email adress is valid';*/
                                          return "email adress cannot be empty";}
                                        else{
                                          return null;
                                        };
                                      },
                                    ),
                                  ),
                                ),
                              ),),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12, 8.0, 12, 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    10.0),
                                color: Colors.white.withOpacity(
                                    0.7),
                                elevation: 0.0,
                                child: Container(
                                  height: 53,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0),
                                    child: ListTile(
                                      title: TextFormField(
                                        controller: _passwordTextController,
                                        obscureText: hidePass,
                                        decoration: InputDecoration(
                                          hintText: "password",
                                          icon: Icon(
                                              Icons.lock_outline,size: 20),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "The password field cannot be empty";
                                          } else if (value.length < 6) {
                                            return "The password has to be at least 6 characters long";
                                          } else {
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
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 8.0, 12.0, 0),
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    10.0),
                                color: Colors.white.withOpacity(
                                    0.7),
                                elevation: 0.0,
                                child: Container(
                                  height: 53,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 6.0),
                                    child: ListTile(
                                      title: TextFormField(
                                        controller: _confirmedPasswordTextController,
                                        obscureText: hidePass,
                                        decoration: InputDecoration(
                                          hintText: "Confirm password",
                                          icon: Icon(
                                            Icons.lock_outline,size: 20,),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "please confirm  your password";
                                          } else if (value.length < 6) {
                                            return "The password has to be at least 6 characters long";
                                          } else
                                          if (_passwordTextController.text != value) {
                                            return "the passwords do not match";
                                          }
                                          else {
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
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 18.0, 14.0, 6.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(
                                    20.0),
                                color: Colors.deepOrange,
                                elevation: 0.0,
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  onPressed:(){}, /*()async{
                                    if(_formKey.currentState.validate()){
                                      if (!(await user.signUp(_nameTextController.text,_emailTextController.text,_passwordTextController.text))){
                                        _Key.currentState.showSnackBar(SnackBar(content: Text("Sign up failed"),));
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                      }}
                                  },*/
                                  child: Text(
                                    "SignUp", textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("Sign up with Google",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blueAccent,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) =>
                                          Login()));
                                },
                                child: Text(
                                  "Already Have an Account",
                                  textAlign: TextAlign.center, style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold, fontSize: 18.0
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /* Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: Center(
                      child: Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                          child: Text("Skip",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),*/
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
          ],
        ),),
    );
  }
/* valueChanged(e) {
    setState(
            () {
          if (e == "male") {
            groupValue = e;
            gender = e;
          } else if (e == "female") {
            groupValue = e;
            gender = e;
          }
        });
  }
  */
}
