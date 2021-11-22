part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: ListView(
        children: [
          Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.03
                          : 20,
                      child: Text(
                        "Profil Saya",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                    Positioned(
                      bottom: 0.1,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Material(
                            elevation: 15,
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.23,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                (BlocProvider.of<UserCubit>(
                                                            context)
                                                        .state as UserLoaded)
                                                    .user
                                                    .picturePath),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -5,
                            right: -5,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Align(
                                    child: IconButton(
                                  iconSize: 20,
                                  color: Colors.blue,
                                  icon: Icon(Icons.camera_alt_rounded,
                                      color: Colors.white),
                                  onPressed: () {
                                    _settingModalBottomSheet(context);
                                  },
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text("Pencari Kerja",
                            style: blackFontStyle3.copyWith(
                                color: Colors.white, fontSize: 13)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextButton.icon(
                                  onPressed: () {
                                    Get.to(() => InfoProfilePage());

                                    // Navigator.push(
                                    //     context,
                                    //     CupertinoPageRoute(
                                    //         builder: (context) =>
                                    //             DetailProfil()));
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 18,
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  label: Text("       Informasi Profil",
                                      style: blackFontStyle3.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.blue)),
                                )),
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextButton.icon(
                                  onPressed: () {
                                    // Get.to(ResetPasswordPage());
                                    Get.to(() => ResetPasswordPage());
                                    // Navigator.push(

                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             GantiPassword1()));
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 18,
                                    child: Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  label: Text("       Ganti Password",
                                      style: blackFontStyle3.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.blue)),
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: TextButton.icon(
                                onPressed: () {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return AlertLogout();
                                  //     });
                                },
                                icon: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 18,
                                  child: Icon(
                                    Icons.power_settings_new,
                                    color: Colors.white,
                                  ),
                                ),
                                label: Text("       Keluar",
                                    style: blackFontStyle3.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.blue)),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),

              //// Header
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              //   height: 220,
              //   margin: EdgeInsets.only(bottom: defaultMargin),
              //   width: double.infinity,
              //   color: Colors.white,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 110,
              //         height: 110,
              //         margin: EdgeInsets.only(bottom: 16),
              //         padding: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage('assets/photo_border.png'))),
              //         child: Container(
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               image: DecorationImage(
              //                   image: NetworkImage(
              //                       (BlocProvider.of<UserCubit>(context).state
              //                               as UserLoaded)
              //                           .user
              //                           .picturePath),
              //                   fit: BoxFit.cover)),
              //         ),
              //       ),
              //       Text(
              //         (BlocProvider.of<UserCubit>(context).state as UserLoaded)
              //             .user
              //             .name,
              //         style: GoogleFonts.poppins(
              //             fontSize: 18, fontWeight: FontWeight.w500),
              //       ),
              //       Text(
              //         (BlocProvider.of<UserCubit>(context).state as UserLoaded)
              //             .user
              //             .email,
              //         style:
              //             greyFontStyle.copyWith(fontWeight: FontWeight.w300),
              //       )
              //     ],
              //   ),
              // ),
              //// Body
              // Container(
              //   width: double.infinity,
              //   color: Colors.white,
              //   child: Column(
              //     children: [
              //       CustomTabBar(
              //         titles: ["Account", "JogjaKarir"],
              //         selectedIndex: selectedIndex,
              //         onTap: (index) {
              //           setState(() {
              //             selectedIndex = index;
              //           });
              //         },
              //       ),
              //       SizedBox(
              //         height: 16,
              //       ),
              //       Column(
              //         children: ((selectedIndex == 0)
              //                 ? [
              //                     'Edit Profile',
              //                     'Home Address',
              //                     'Security',
              //                     'Payment'
              //                   ]
              //                 : [
              //                     'Rate App',
              //                     'Help Center',
              //                     'Privacy & Policy',
              //                     'Term & Condition'
              //                   ])
              //             .map((e) => Padding(
              //                   padding: EdgeInsets.only(
              //                       bottom: 16,
              //                       left: defaultMargin,
              //                       right: defaultMargin),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         e,
              //                         style: blackFontStyle3,
              //                       ),
              //                       SizedBox(
              //                         height: 24,
              //                         width: 24,
              //                         child: Image.asset(
              //                           'assets/right_arrow.png',
              //                           fit: BoxFit.contain,
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ))
              //             .toList(),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.all(20),
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Foto Profil',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              children: [
                InkWell(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            color: Colors.blue,
                            child: Icon(
                              Icons.restore_from_trash_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          'Hapus Foto',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                Padding(padding: EdgeInsets.only(right: 30)),
                InkWell(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            color: Colors.blue,
                            child: Icon(
                              Icons.insert_photo_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          'Galery',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    // await _getImage(ImageSource.gallery, context);
                  },
                ),
                Padding(padding: EdgeInsets.only(right: 30)),
                InkWell(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            color: Colors.blue,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(
                          'Camera',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    // await _getImage(ImageSource.camera, context);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
