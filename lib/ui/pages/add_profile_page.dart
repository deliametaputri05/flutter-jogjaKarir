part of 'pages.dart';

class AddProfilePage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddProfilePage(this.user, this.password, this.pictureFile);

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController eduController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  bool isLoading = false;
  List<String> levels;
  String selectedLevel;

  @override
  void initState() {
    super.initState();

    levels = ['Pilih Jenjang', 'SMA / SMK', 'D3', 'S1', 'S2', 'S3'];
    selectedLevel = levels[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Your Profile',
      subtitle: "Make sure it's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Alamat",
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
              controller: addressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.home_outlined,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Alamat'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Pendidikan",
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
              controller: eduController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.school_outlined,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Instansi Pendidikan Akhir'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Jurusan",
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
              controller: majorController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.school_outlined,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Jurusan'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Jenjang Pendidikan",
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
            child: DropdownButton(
                value: selectedLevel,
                isExpanded: true,
                underline: SizedBox(),
                items: levels
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: blackFontStyle3.copyWith(fontSize: 15),
                        )))
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedLevel = item;
                  });
                }),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Tahun Lulus",
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
              controller: yearController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range_outlined,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Tahun Lulus'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Nilai Akhir / IPK",
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
              controller: gpaController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.rate_review_outlined,
                    color: Colors.blue,
                  ),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Nilai Akhir / IPK'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Kemampuan",
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
              controller: skillController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.bar_chart_rounded, color: Colors.blue),
                  border: InputBorder.none,
                  hintStyle: greyFontStyle.copyWith(fontSize: 15),
                  hintText: 'Kemampuan'),
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
                      User user = widget.user.copyWith();

                      setState(() {
                        isLoading = true;
                      });

                      // await BlocProvider.of<UserCubit>(context).signUp(
                      //     user, widget.password,
                      //     pictureFile: widget.pictureFile);

                      UserState state =
                          BlocProvider.of<UserCubit>(context).state;

                      if (state is UserLoaded) {
                        BlocProvider.of<JobCubit>(context).getJobs();
                        // BlocProvider.of<TransactionCubit>(context)
                        //     .getTransactions();
                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign Up Failed",
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
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor)),
                    child: Text(
                      'Sign Up Now',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
