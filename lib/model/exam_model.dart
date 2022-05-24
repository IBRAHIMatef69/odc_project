class ExamModel {
  bool? success;
  String? message;
  List<ExamDataModel>? data;

  ExamModel({this.success, this.message, this.data});

  ExamModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ExamDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ExamDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExamDataModel {
  int? id;
  String? question;
  int? questionMark;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? correctAnswer;
  int? examId;

  ExamDataModel(
      {this.id,
        this.question,
        this.questionMark,
        this.answer1,
        this.answer2,
        this.answer3,
        this.answer4,
        this.correctAnswer,
        this.examId});

  ExamDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    questionMark = json['question_mark'];
    answer1 = json['answer_1'];
    answer2 = json['answer_2'];
    answer3 = json['answer_3'];
    answer4 = json['answer_4'];
    correctAnswer = json['correct_answer'];
    examId = json['exam_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['question_mark'] = this.questionMark;
    data['answer_1'] = this.answer1;
    data['answer_2'] = this.answer2;
    data['answer_3'] = this.answer3;
    data['answer_4'] = this.answer4;
    data['correct_answer'] = this.correctAnswer;
    data['exam_id'] = this.examId;
    return data;
  }
}
