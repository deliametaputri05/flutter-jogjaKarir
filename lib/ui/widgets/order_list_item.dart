part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Apply apply;
  final double itemWidth;

  OrderListItem({@required this.apply, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: (apply?.job?.company?.picturePath != null)
                    ? DecorationImage(
                        image: NetworkImage(apply.job.company.picturePath),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage('assets/photo.png'),
                        fit: BoxFit.cover,
                      ))),
        SizedBox(
          width: itemWidth - 60 - 12 - 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                apply.job.position,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                  symbol: 'IDR ',
                  decimalDigits: 0,
                  locale: 'id-ID',
                ).format(apply.job.salary),
                style: greyFontStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDateTime(apply.dateTime),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
              (apply.status == ApplyStatus.diproses)
                  ? Text(
                      'Sedang di proses',
                      style: GoogleFonts.poppins(
                          color: 'D9435E'.toColor(), fontSize: 10),
                    )
                  : (apply.status == ApplyStatus.terkirim)
                      ? Text(
                          'Terkirim',
                          style: GoogleFonts.poppins(
                              color: 'D9435E'.toColor(), fontSize: 10),
                        )
                      : (apply.status == ApplyStatus.diterima)
                          ? Text(
                              'Di Terima \nCek email Anda',
                              style: GoogleFonts.poppins(
                                  color: '1ABC9C'.toColor(), fontSize: 10),
                            )
                          : (apply.status == ApplyStatus.ditolak)
                              ? Text(
                                  'Tidak diterima',
                                  style: GoogleFonts.poppins(
                                      color: 'D9435E'.toColor(), fontSize: 10),
                                )
                              : SizedBox()
            ],
          ),
        )
      ],
    );
  }

  //Convert DateTime
  String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
      default:
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
