part of 'models.dart';

class Education {
  int id, userId;
  User user;
  String name;
  String major;
  String level;
  String year;
  String gpa;
  String skill;

  Education(
      {this.id,
      this.user,
      this.name,
      this.major,
      this.level,
      this.year,
      this.gpa,
      this.skill});

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = (json['user'] != null) ? User.fromJson(json['user']) : null;
    userId = json['user_id'];
    name = json['name'];
    major = json['major'];
    level = json['level'];
    year = json['year'];
    gpa = json['gpa'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'major': major,
      'level': level,
      'year': year,
      'gpa': gpa,
      'skill': skill,
    };
  }

  @override
  List<Object> get props => [id, name, year, major, level, gpa, skill];
}
