part of 'models.dart';

enum ApplyStatus { terkirim, diterima, ditolak, diproses }

class Apply extends Equatable {
  final int id;
  final Job job;
  final String letter;
  final DateTime dateTime;
  final ApplyStatus status;
  final User user;
  final String file;

  Apply(
      {this.id,
      this.job,
      this.letter,
      this.dateTime,
      this.status,
      this.user,
      this.file});

  factory Apply.fromJson(Map<String, dynamic> data) {
    print("ini id => ${data['id']}");
    print('Ini Job => ${data['job']}');
    return Apply(
        id: data['id'],
        job: Job.fromJson(data['job']),
        letter: data['letter'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
        file: data['file'],
        status: (data['status'] == 'TERKIRIM')
            ? ApplyStatus.terkirim
            : (data['status'] == 'DITOLAK')
                ? ApplyStatus.ditolak
                : (data['status'] == 'DITERIMA')
                    ? ApplyStatus.diterima
                    : ApplyStatus.diproses);
  }

  Apply copyWith(
          {int id,
          Job job,
          String letter,
          String file,
          DateTime dateTime,
          ApplyStatus status,
          User user}) =>
      Apply(
          id: id ?? this.id,
          job: job ?? this.job,
          letter: letter ?? this.letter,
          file: file ?? this.file,
          dateTime: dateTime ?? this.dateTime,
          status: status ?? this.status,
          user: user ?? this.user);

  @override
  List<Object> get props => [id, job, letter, file, dateTime, status, user];
}
