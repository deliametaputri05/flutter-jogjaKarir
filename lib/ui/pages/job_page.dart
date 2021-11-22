part of 'pages.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: ListView(
        children: [
          Column(
            children: [
              //// HEADER
              Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 100,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Jogja Karir',
                          style: blackFontStyle1,
                        ),
                        Text(
                          "Let's find a job for your passion",
                          style: greyFontStyle.copyWith(
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                  (BlocProvider.of<UserCubit>(context).state
                                          as UserLoaded)
                                      .user
                                      .picturePath),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
              //// LIST OF FOOD
              Container(
                height: 258,
                width: double.infinity,
                child: BlocBuilder<JobCubit, JobState>(
                  builder: (_, state) => (state is JobLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.jobs
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: (e == state.jobs.first)
                                                ? defaultMargin
                                                : 0,
                                            right: defaultMargin),
                                        child: GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                JobDetailsPage(
                                                  apply: Apply(
                                                      job: e,
                                                      user: (BlocProvider.of<
                                                                      UserCubit>(
                                                                  context)
                                                              .state as UserLoaded)
                                                          .user),
                                                  onBackButtonPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              );
                                            },
                                            child: JobCard(e)),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(child: loadingIndicator),
                ),
              ),
              //// LIST OF JOB (TABS)
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTabBar(
                      titles: ['Lowongan Baru', 'Populer', 'Rekomendasi'],
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
                    BlocBuilder<JobCubit, JobState>(builder: (_, state) {
                      if (state is JobLoaded) {
                        List<Job> jobs = state.jobs
                            .where((element) =>
                                element.category.contains((selectedIndex == 0)
                                    ? JobCategory.new_job
                                    : (selectedIndex == 1)
                                        ? JobCategory.popular
                                        : JobCategory.recommended))
                            .toList();

                        return Column(
                          children: jobs
                              .map((e) => Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        defaultMargin, 0, defaultMargin, 16),
                                    child: JobListItem(
                                        job: e, itemWidth: listItemWidth),
                                  ))
                              .toList(),
                        );
                      } else {
                        return Center(child: loadingIndicator);
                      }
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ],
      ),
    );
  }
}
