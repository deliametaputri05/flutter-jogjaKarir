part of 'pages.dart';

class JobDetailsPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Apply apply;
  // final Transaction transaction;

  JobDetailsPage({this.onBackButtonPressed, this.apply});

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  int selectedIndex = 0;
  int quantity = 1;

// _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
              child: Container(
            height: 300,
            color: Colors.blue,
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.apply.job.company.picturePath),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.apply.job.company.name,
                            style:
                                blackFontStyle3.copyWith(color: Colors.white),
                          ),
                          Text(
                            widget.apply.job.position,
                            style: blackFontStyle1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Text(
                            NumberFormat.currency(
                              symbol: 'RP ',
                              decimalDigits: 0,
                              locale: 'id-ID',
                            ).format(widget.apply.job.salary),
                            style: blackFontStyle1.copyWith(
                                fontSize: 15, color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            width: 80,
                            child: Text(
                              widget.apply.job.types,
                              style: blackFontStyle3.copyWith(
                                  fontSize: 11, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  //// Back Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.onBackButtonPressed != null) {
                                widget.onBackButtonPressed();
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.all(3),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black12,
                                ),
                                child: Icon(Icons.arrow_back_outlined,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.onBackButtonPressed != null) {
                                widget.onBackButtonPressed();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black12,
                              ),
                              child: Icon(Icons.share_outlined,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //// Body
                  Container(
                    margin: EdgeInsets.only(top: 180),
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: [
                              'Deskripsi',
                              'Syarat',
                              'Fasilitas',
                              'Profil',
                            ],
                            selectedIndex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                              (selectedIndex == 0)
                                  ? widget.apply.job.desc
                                  : (selectedIndex == 1)
                                      ? widget.apply.job.requirement
                                      : (selectedIndex == 2)
                                          ? widget.apply.job.facilities
                                          : widget.apply.job.company.desc,
                              style: blackFontStyle3.copyWith(fontSize: 13))
                          // Column(
                          //   children: ((selectedIndex == 0)
                          //           ? [
                          //               '{{Edit Profile}}',
                          //               'Home Address',
                          //               'Security',
                          //               'Payment'
                          //             ]
                          //           : [
                          //               'Rate App',
                          //               'Help Center',
                          //               'Privacy & Policy',
                          //               'Term & Condition'
                          //             ])
                          //       .map((e) => Padding(
                          //             padding: EdgeInsets.only(
                          //                 bottom: 16,
                          //                 left: defaultMargin,
                          //                 right: defaultMargin),
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Text(
                          //                   e,
                          //                   style: blackFontStyle3,
                          //                 ),
                          //                 SizedBox(
                          //                   height: 24,
                          //                   width: 24,
                          //                   child: Image.asset(
                          //                     'assets/right_arrow.png',
                          //                     fit: BoxFit.contain,
                          //                   ),
                          //                 )
                          //               ],
                          //             ),
                          //           ))
                          //       .toList(),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 8, top: 2),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[Icon(Icons.bookmark_border_outlined)],
                // ),
                child: IconButton(
                  icon:
                      Icon(Icons.bookmark_border_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8, top: 2),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                    onPressed: () {
                      Get.to(ApplyPage(
                        apply: widget.apply,
                      ));
                    },
                    child: Text(
                      'Lamar Sekarang',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
