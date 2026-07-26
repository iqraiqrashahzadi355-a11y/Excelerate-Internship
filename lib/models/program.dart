class Program {
  final String title;
  final String startDate;
  final String description;
  final String eligibility;
  final String schedule;
  final String heroImageUrl;
  final String duration;
  final String certification;
  final int cohortSize;
  final String instructorName;
  final String instructorTitle;
  double rating;
  String reviewText;
  String reviewAuthor;

  Program({
    required this.title,
    required this.startDate,
    required this.description,
    required this.eligibility,
    required this.schedule,
    this.heroImageUrl = '',
    this.duration = '',
    this.certification = '',
    this.cohortSize = 0,
    this.instructorName = '',
    this.instructorTitle = '',
    this.rating = 0,
    this.reviewText = '',
    this.reviewAuthor = '',
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      title: json['title'] as String,
      startDate: json['startDate'] as String,
      description: json['description'] as String,
      eligibility: json['eligibility'] as String,
      schedule: json['schedule'] as String,
      heroImageUrl: json['heroImageUrl'] as String,
      duration: json['duration'] as String,
      certification: json['certification'] as String,
      cohortSize: json['cohortSize'] as int,
      instructorName: json['instructorName'] as String,
      instructorTitle: json['instructorTitle'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewText: json['reviewText'] as String,
      reviewAuthor: json['reviewAuthor'] as String,
    );
  }
}
