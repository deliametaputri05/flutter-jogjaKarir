part of 'widgets.dart';

class JobListItem extends StatelessWidget {
  final Job job;
  final double itemWidth;

  JobListItem({@required this.job, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 330.0,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    job.company.picturePath),
                                                fit: BoxFit.cover,
                                              )),
                                        ))),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: job.company.name,
                                      style:
                                          greyFontStyle.copyWith(fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "\n" + job.position,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.bookmark_outline,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    child: Row(
                                      children: <Widget>[
                                        RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            text: NumberFormat.currency(
                                              symbol: 'RP ',
                                              decimalDigits: 0,
                                              locale: 'id-ID',
                                            ).format(job.salary),
                                            style: blackFontStyle3.copyWith(
                                                fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "\n" +
                                                    job.company.location +
                                                    " , Indonesia",
                                                style: blackFontStyle3,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10, bottom: 15),
                                    child: Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            width: 50,
                                            child: Text(
                                              job.lastEdu,
                                              style: blackFontStyle3.copyWith(
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10, bottom: 15),
                                    child: Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            width: 80,
                                            child: Text(
                                              job.types,
                                              style: blackFontStyle3.copyWith(
                                                  fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                    bottom: 15,
                                    top: 10,
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: RatingStars(job.rate),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
