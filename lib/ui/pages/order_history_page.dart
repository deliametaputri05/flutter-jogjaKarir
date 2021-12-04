part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: BlocBuilder<ApplyCubit, ApplyState>(builder: (_, state) {
        if (state is ApplyLoaded) {
          if (state.apply.length == 0) {
            return IllustrationPage(
              title: 'Saya Pencari Kerja !',
              subtitle: 'Seems you like have not\nordered any food yet',
              picturePath: 'assets/love_burger.png',
              buttonTitle1: 'Temukan Karir',
              buttonTap1: () {},
            );
          } else {
            double listItemWidth =
                MediaQuery.of(context).size.width - 2 * defaultMargin;
            return RefreshIndicator(
              onRefresh: () async {
                await BlocProvider.of<ApplyCubit>(context).getApply();
              },
              child: ListView(
                children: [
                  Column(
                    children: [
                      //// Header
                      Container(
                        height: 100,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: defaultMargin),
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Riwayat',
                              style: blackFontStyle1,
                            ),
                            Text(
                              'Status lamar pekerjaan',
                              style: greyFontStyle.copyWith(
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      //// Body
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            CustomTabBar(
                              titles: ['Dalam Proses', 'Hasil'],
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
                            Builder(builder: (_) {
                              List<Apply> apply = (selectedIndex == 0)
                                  ? state.apply
                                      .where((element) =>
                                          element.status ==
                                              ApplyStatus.terkirim ||
                                          element.status ==
                                              ApplyStatus.diproses)
                                      .toList()
                                  : state.apply
                                      .where((element) =>
                                          element.status ==
                                              ApplyStatus.diterima ||
                                          element.status == ApplyStatus.ditolak)
                                      .toList();

                              return Column(
                                children: apply
                                    .map((e) => Padding(
                                          padding: EdgeInsets.only(
                                              right: defaultMargin,
                                              left: defaultMargin,
                                              bottom: 16),
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (e.status ==
                                                  ApplyStatus.terkirim) {
                                                print("terkirim");
                                              }
                                            },
                                            child: OrderListItem(
                                                apply: e,
                                                itemWidth: listItemWidth),
                                          ),
                                        ))
                                    .toList(),
                              );
                            }),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        } else {
          return Center(child: loadingIndicator);
        }
      }),
    );
  }
}
