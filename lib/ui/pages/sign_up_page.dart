part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noHPController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isLoading = false;
  bool _isHidePassword = true;
  String error = '';
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign Up',
      subtitle: "Register and Apply Job",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: 110,
              height: 110,
              // margin: EdgeInsets.only(top: 26),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/photo_border.png'))),
              child: (pictureFile != null)
                  ? Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(pictureFile),
                              fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/photo.png'),
                              fit: BoxFit.cover)),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Nama Lengkap",
              style: blackFontStyle3,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue)),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Nama Lengkap'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Email",
              style: blackFontStyle3,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue)),
            child: TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Isi Email-mu disini' : null,
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.blue),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Alamat Email'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle3,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue)),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Isi Password-Mu disini!'),
                  MinLengthValidator(6,
                      errorText: 'Password-mu minimal 6 Karakter!')
                ]),
                obscureText: _isHidePassword,
                controller: passwordController,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglePasswordVisibility();
                      },
                      child: Icon(
                        _isHidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isHidePassword ? Colors.grey : Colors.blue,
                      ),
                    ),
                    prefixIcon:
                        Icon(Icons.lock_outline_sharp, color: Colors.blue),
                    border: InputBorder.none,
                    hintStyle: greyFontStyle.copyWith(fontSize: 15),
                    hintText: 'Password'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "No Telephone",
              style: blackFontStyle3,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue)),
            child: TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Isi Email-mu disini' : null,
              controller: noHPController,
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.smartphone_outlined, color: Colors.blue),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'No Telephone'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Alamat Asal",
              style: blackFontStyle3,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue)),
            child: TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Isi Email-mu disini' : null,
              controller: addressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.house_rounded, color: Colors.blue),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Alamat Asal'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await BlocProvider.of<UserCubit>(context).signUp(
                          User(
                            name: nameController.text,
                            email: emailController.text,
                            noHp: emailController.text,
                            address: emailController.text,
                          ),
                          passwordController.text,
                          pictureFile);
                      UserState state =
                          BlocProvider.of<UserCubit>(context).state;

                      if (state is UserLoaded) {
                        BlocProvider.of<JobCubit>(context).getJobs();
                        BlocProvider.of<ApplyCubit>(context).getApply();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Gagal Register",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              (state as UserLoadingFailed).message,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                        setState(() {
                          isLoading = false;
                        });
                      }

                      // Get.to(MainPage());

                      // Get.to(AddProfilePage(
                      //     User(
                      //       name: nameController.text,
                      //       email: emailController.text,
                      //     ),
                      //     passwordController.text,
                      //     pictureFile));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor)),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
