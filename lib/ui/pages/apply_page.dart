part of 'pages.dart';

class ApplyPage extends StatefulWidget {
  final Apply apply;

  ApplyPage({this.apply});
  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  File file;

  TextEditingController letterController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20)),
          Container(
            color: Colors.blue,
            height: 100,
          ),
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Kirim Lamaran',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Upload CV (Pdf)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    // Expanded(
                                    //   child: TextFormField(
                                    //     decoration: InputDecoration(
                                    //         border: OutlineInputBorder(),
                                    //         hintText: 'Upload file CV kamu'),
                                    //   ),
                                    // ),
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 16),
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          'Pilih File',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onTap: () async {
                                        final result = await FilePicker.getFile(
                                            type: FileType.custom,
                                            allowedExtensions: ['pdf']);

                                        if (result != null) {
                                          file = File(result.path);
                                          setState(() {});
                                        }

                                        print('Path: ${file.path}');
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  'Surat Lamaran Kerja',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: TextField(
                                    controller: letterController,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Ketikan surat lamaran kerja kamu ...',
                                      hintStyle:
                                          TextStyle(color: Colors.black38),
                                      fillColor: Colors.green[50],
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    (isLoading)
                        ? Center(child: loadingIndicator)
                        : Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });

                                String url =
                                    await BlocProvider.of<ApplyCubit>(context)
                                        .submitApply(
                                            widget.apply.copyWith(
                                                letter: letterController.text),
                                            file: file);

                                if (url != null) {
                                  Get.snackbar("berhasil", "melamar pekerjaan");
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });

                                  Get.snackbar("", "",
                                      backgroundColor: "D9435E".toColor(),
                                      icon: Icon(
                                        MdiIcons.closeCircleOutline,
                                        color: Colors.white,
                                      ),
                                      titleText: Text(
                                        'Kirim Lamaran Gagal',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      messageText: Text(
                                        'Please type again later.',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ));
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          mainColor)),
                              child: Text(
                                "Kirim Lamaran",
                                style: blackFontStyle3.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Future<File> saveFilePermanently(PlatformFile file) async {

  // }
  // void openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }
}
