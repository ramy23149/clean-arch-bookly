import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  final bool? isAvailable;
  final String? downloadLink;

  const Pdf({this.isAvailable, this.downloadLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json['isAvailable'] as bool?,
        downloadLink: json['downloadLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'downloadLink': downloadLink,
      };

  @override
  List<Object?> get props => [isAvailable, downloadLink];
}
