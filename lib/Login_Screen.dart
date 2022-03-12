import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _pageState = 1;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFFB40284A);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFFB40284A);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
              width: double.infinity,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color(0xFFF75C5C),
                Color(0xFFFFCE95),
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 150.0,
                        ),
                        FadeAnimation(
                            1,
                            Text(
                              "Login & Sign Up Screen",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Sofia"),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 20),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            height: _loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    FadeAnimation(
                        1.4,
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(32, 132, 232, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                      ),
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Sofia"),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.vpn_key),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Sofia"),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('forget working working');
                      },
                      child: Container(
                        child: FadeAnimation(
                            1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.grey, fontFamily: "Sofia"),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.6,
                      FlatButton(
                        onPressed: () {
                          print("success");
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFF75C5C)),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.7,
                        Text(
                          "Continue with social media  & OTP",
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "Sofia"),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: FadeAnimation(
                              1.8,
                              Container(
                                  child: MaterialButton(
                                onPressed: () {},
                                color: Color(0xFF3b5998),
                                textColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.facebookF,
                                  size: 22,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ))),
                        ),
                        // SizedBox(width: 10,),
                        Container(
                          child: FadeAnimation(
                              1.9,
                              Container(
                                  child: MaterialButton(
                                onPressed: () {},
                                color: Color(0xFFEA4335),
                                textColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.google,
                                  size: 22,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ))),
                        ),
                        Container(
                          child: FadeAnimation(
                              1.9,
                              Container(
                                  child: MaterialButton(
                                onPressed: () {},
                                color: Color(0xFF34A853),
                                textColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.mobileAlt,
                                  size: 22,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ))),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        print('sign up working');
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: Container(
                        child: FadeAnimation(
                            1.5,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an Account? ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Sofia"),
                                  ),
                                  Text(
                                    "Sign Up ",
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontFamily: "Sofia",
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedContainer(
            height: _registerHeight,
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Create a New Account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                FadeAnimation(
                    1.4,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(32, 132, 232, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade200))),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                  ),
                                  hintText: "Email or Phone number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontFamily: "Sofia"),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade200))),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontFamily: "Sofia"),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade200))),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontFamily: "Sofia"),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1.6,
                  FlatButton(
                    onPressed: () {
                      print("success");
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFF75C5C)),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.7,
                    Text(
                      "Continue with social media  & OTP",
                      style: TextStyle(color: Colors.grey, fontFamily: "Sofia"),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FadeAnimation(
                          1.8,
                          Container(
                              child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFF3b5998),
                            textColor: Colors.white,
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ))),
                    ),
                    // SizedBox(width: 10,),
                    Container(
                      child: FadeAnimation(
                          1.9,
                          Container(
                              child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFFEA4335),
                            textColor: Colors.white,
                            child: Icon(
                              FontAwesomeIcons.google,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ))),
                    ),
                    Container(
                      child: FadeAnimation(
                          1.9,
                          Container(
                              child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFF34A853),
                            textColor: Colors.white,
                            child: Icon(
                              FontAwesomeIcons.mobileAlt,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ))),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    print('Login is  working');
                    setState(() {
                      _pageState = 1;
                    });
                  },
                  child: Container(
                    child: FadeAnimation(
                        1.5,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already Have an Account? ",
                                style: TextStyle(
                                    color: Colors.grey, fontFamily: "Sofia"),
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontFamily: "Sofia",
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({required this.icon, required this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontFamily: "Sofia"),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint),
            ),
          )
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({required this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB40284A), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({required this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFB40284A), width: 2),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Color(0xFFB40284A), fontSize: 16),
        ),
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<String>()
      ..add("opacity", Tween(begin: 0.0, end: 1.0), Duration(milliseconds: 500))
      ..add("translateY", Tween(begin: -30.0, end: 0.0),
          Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<String>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get("opacity"),
        child: Transform.translate(
            offset: Offset(0, animation.get("translateY")), child: child),
      ),
    );
  }
}
