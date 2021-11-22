part of 'models.dart';

enum JobCategory { new_job, popular, recommended }

class Job {
  int id, companyId;
  User user;
  Company company;
  String desc;
  String facilities;
  String requirement;
  String position;
  String lastEdu;
  String age;
  String gender;
  int salary;
  double rate;
  List<JobCategory> category;
  String types;
  int qouta;
  String lastDate;
  String workExp;

  Job(
      {this.id,
      this.user,
      this.company,
      this.desc,
      this.facilities,
      this.requirement,
      this.position,
      this.lastEdu,
      this.age,
      this.gender,
      this.salary,
      this.rate,
      this.category = const [],
      this.types,
      this.qouta,
      this.lastDate,
      this.workExp});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // company = Company.fromJson(json['company']);
    // company = (json[company] != null) ? Company.fromJson(json[company]) : null;
    company =
        (json['company'] != null) ? Company.fromJson(json['company']) : null;
    companyId = json['company_id'];
    desc = json['desc'];
    facilities = json['facilities'];
    requirement = json['requirement'];
    position = json['position'];
    lastEdu = json['last_edu'];
    age = json['age'];
    gender = json['gender'];
    salary = json['salary'];
    types = json['types'];
    qouta = json['qouta'];
    lastDate = json['last_date'];
    workExp = json['work_exp'];
    rate = (json['rate'] as num).toDouble();
    category = json['category'].toString().split(',').map((e) {
      switch (e) {
        case 'recommended':
          return JobCategory.recommended;
          break;
        case 'popular':
          return JobCategory.popular;
          break;
        default:
          return JobCategory.new_job;
      }
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc': desc,
      'position': position,
      'facilities': facilities,
      'requirement': requirement,
      'category': category,
      'lastEdu': lastEdu,
      'lastDate': lastDate,
      'workExp': workExp,
      'age': age,
      'gender': gender,
      'quota': qouta,
      'types': types,
      'salary': salary,
      'rate': rate,
    };
  }

//   Job copyWith(
//       {int id,
//       Company company,
//       String desc,
//       String facilities,
//       String requirement,
//       String position,
//       String lastEdu,
//       String lastDate,
//       String gender,
//       String age,
//       int salary,
//       double rate,
//       String category,
//       String types,
//       String workExp,
//       int qouta,
//       User user}) {
//     return Job(
//         id: id ?? this.id,
//         company: company ?? this.company,
//         desc: desc ?? this.desc,
//         facilities: facilities ?? this.facilities,
//         requirement: requirement ?? this.requirement,
//         position: position ?? this.position,
//         lastEdu: lastEdu ?? this.lastEdu,
//         lastDate: lastDate ?? this.lastDate,
//         gender: gender ?? this.gender,
//         age: age ?? this.age,
//         salary: salary ?? this.salary,
//         rate: rate ?? this.rate,
//         category: category ?? this.category,
//         qouta: qouta ?? this.qouta,
//         types: types ?? this.types,
//         workExp: workExp ?? this.workExp,
//         user: user ?? this.user);
//   }

//   @override
//   List<Object> get props => [
//         id,
//         user,
//         company,
//         desc,
//         facilities,
//         requirement,
//         position,
//         lastEdu,
//         gender,
//         age,
//         salary,
//         rate,
//         category,
//         lastDate,
//         workExp,
//       ];
// }

// List<Job> mockFoods = [
//   Food(
//       id: 1,
//       picturePath:
//           "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg",
//       name: "Sate Sayur Sultan",
//       description: "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan bermutu tinggi. Semua bahan ditanam dengan menggunakan teknologi masa kini sehingga memiliki nutrisi yang kaya.",
//       facilities: "Bawang Merah, Paprika, Bawang Bombay, Timun",
//       position: 150000,
//       rate: 4.2,
//       types: [FoodType.new_food, FoodType.recommended, FoodType.popular]),
//   Food(
//       id: 2,
//       picturePath:
//           "https://cdns.klimg.com/dream.co.id/resources/news/2020/04/06/133546/bikin-steak-di-rumah-pastikan-bumbunya-meresap-2004066.jpg",
//       name: "Steak Daging Sapi Korea",
//       description:
//           "Daging sapi Korea adalah jenis sapi paling premium di Korea. Namun, untuk menikmatinya Anda tidak perlu jauh-jauh ke Korea Selatan. Steak Sapi Korea Oppa Bandung ini sudah terkenal di seluruh Indonesia dan sudah memiliki lebih dari 2 juta cabang.",
//       facilities: "Daging Sapi Korea, Garam, Lada Hitam",
//       position: 750000,
//       rate: 4.5),
//   Food(
//       id: 3,
//       picturePath:
//           "https://i1.wp.com/varminz.com/wp-content/uploads/2019/12/mexican-chopped-salad3.jpg?fit=843%2C843&ssl=1",
//       name: "Mexican Chopped Salad",
//       description: "Salad ala mexico yang kaya akan serat dan vitamin. Seluruh bahan diambil dari Mexico sehingga akan memiliki cita rasa yang original.",
//       facilities: "Jagung, Selada, Tomat Ceri, Keju, Wortel",
//       position: 105900,
//       rate: 3.9,
//       types: [FoodType.new_food]),
//   Food(
//       id: 4,
//       picturePath:
//           "https://images.immediate.co.uk/production/volatile/sites/2/2016/08/25097.jpg?quality=90&resize=768,574",
//       name: "Sup Wortel Pedas",
//       description: "Sup wortel pedas yang unik ini cocok banget buat kalian-kalian yang suka pedas namun ingin tetap sehat. Rasanya yang unik akan memanjakan lidah Anda.",
//       facilities: "Wortel, Seledri, Kacang Tanah, Labu, Garam, Gula",
//       position: 60000,
//       rate: 4.9,
//       types: [FoodType.recommended]),
//   Food(
//       id: 5,
//       picturePath:
//           "https://cmxpv89733.i.lithium.com/t5/image/serverpage/image-id/478345i84598AB4FEB454CB/image-size/large?v=1.0&px=999",
//       name: "Korean Raw Beef Tartare",
//       description:
//           "Daging sapi Korea cincang yang disajikan mentah dan disiram saus spesial dengan toping kuning telur dan taburan biji wijen.",
//       facilities: "Daging Sapi Korea, Telur, Biji Wijen",
//       position: 350000,
//       rate: 3.4)
// ];
}
