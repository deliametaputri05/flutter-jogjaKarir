part of 'widgets.dart';

class JobCard extends StatelessWidget {
  final Job job;

  JobCard(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 300.0,
        height: 160,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 1,
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.position,
                          style: blackFontStyle1.copyWith(
                              color: Colors.white, fontSize: 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            NumberFormat.currency(
                              symbol: 'RP ',
                              decimalDigits: 0,
                              locale: 'id-ID',
                            ).format(job.salary),
                            style: blackFontStyle1.copyWith(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5),
                        //   child: RatingStarsWhite(food.rate),
                        // ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.bookmark_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: (job.company.picturePath == null)
                                    ? AssetImage('assets/photo.png')
                                    : NetworkImage(job.company.picturePath),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.company.name,
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                            Text(
                              job.company.location,
                              style: blackFontStyle3.copyWith(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Deadline \n" + job.lastDate,
                      style: blackFontStyle3.copyWith(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
