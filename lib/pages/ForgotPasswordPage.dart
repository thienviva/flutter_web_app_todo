import 'package:flutter/material.dart';
import 'package:flutter_web_app_todo/Service/Auth_Service.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  AuthClass auth = AuthClass();
  String? email;
  String msg = "";
  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quên Mật Khẩu"),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          padding: EdgeInsets.all(15),
          child: Form(
            key: keys,
            child: Column(
              children: [
                Text(
                  "Nhập Email Của Bạn",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 55,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (e) => email = e,
                    validator: (e) => e!.isEmpty ? "Bạn chưa nhập Email" : null,
                    decoration: InputDecoration(
                      hintText: "Nhập email của bạn",
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.amber,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    if (keys.currentState!.validate()) {
                      loading(context);
                      bool send = await auth.resetpassword(email!);
                      if (send) {
                        msg =
                            "Kiếm tra Hộp Thư Đến của Email để đặt lại mật khẩu!";
                        Navigator.of(context).pop();
                        setState(() {});
                      } else {
                        msg = "Email chưa chính xác! Hãy kiểm tra lại!";
                        Navigator.of(context).pop();
                        setState(() {});
                      }
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 90,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(0xfffd746c),
                        Color(0xffff9068),
                        Color(0xfffd746c)
                      ]),
                    ),
                    child: Center(
                      child: Text(
                        "Xác Nhận",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  loading(context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Center(
            child: Container(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ));
}
