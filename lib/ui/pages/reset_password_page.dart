part of 'pages.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController emailController = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganti Password'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: ListView(
          children: [
            Text(
              "Masukkan email yang tertaut dengan akun kamu dan kami akan kirimkan email dengan instruksi untuk mengganti password.",
              style: blackFontStyle3,
              textAlign: TextAlign.justify,
            ),
            Container(
              margin: EdgeInsets.only(top: 19),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alamat email kamu",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Isi Email-mu disini!'),
                        EmailValidator(errorText: 'Format Email tidak valid!')
                      ]),
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "@gmail.com"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        child: Text(
                          "Kirim permintaan",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onTap: () {
                        Get.to(() => SuccessResetPasswordPage());

                        // if (_formKey.currentState!.validate()) {
                        //   print('Email Request sent');
                        //   AuthServices.resetPassword(emailController.text);
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => GantiPassword2(),
                        //       ));
                        // } else {
                        //   print("terjadi kesalahan");
                        // }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
