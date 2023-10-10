import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';

class ResearchDetail {
  ResearchDetail({
    required this.id,
    required this.lecture,
    required this.title,
    required this.description,
    required this.research_duration,
    required this.research_type,
    required this.research_field,
    required this.research_start_date_time,
    required this.research_end_date_time,
    required this.research_cover,
    required this.research_dates,
    required this.research_components,
    required this.location,
    required this.guide_book,
  });

  late final String id;
  late final String lecture;
  late final String title;
  late final String description;
  late final int research_duration;
  late final String research_type;
  late final String research_field;
  late final String research_start_date_time;
  late final String research_end_date_time;
  late final String research_cover;
  late final List<ResearchDate> research_dates;
  late final List<ResearchComponent> research_components;
  late final String location;
  late final String guide_book;

  ResearchDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? ''; // Use an empty string as a default if 'id' is null
    lecture = json['lecture'] ??
        ''; // Use an empty string as a default if 'lecture' is null
    title = json['title'] ??
        ''; // Use an empty string as a default if 'title' is null
    description = json['description'] ??
        ''; // Use an empty string as a default if 'description' is null
    research_duration = json['research_duration'] ??
        0; // Use 0 as a default if 'research_duration' is null
    research_type = json['research_type'] ??
        ''; // Use an empty string as a default if 'research_type' is null
    research_field = json['research_field'] ??
        ''; // Use an empty string as a default if 'research_field' is null
    research_start_date_time = json['research_start_date_time'] ??
        ''; // Use an empty string as a default if 'research_start_date_time' is null
    research_end_date_time = json['research_end_date_time'] ??
        ''; // Use an empty string as a default if 'research_end_date_time' is null
    research_cover = json['research_cover'] ??
        ''; // Use an empty string as a default if 'research_cover' is null
    location = json['location'] ??
        ''; // Use an empty string as a default if 'location' is null
    guide_book = json['guide_book'] ??
        ''; // Use an empty string as a default if 'guide_book' is null

    research_dates = List.from(json['research_dates'] ?? [])
        .map((e) => ResearchDate.fromJson(e))
        .toList();
    research_components = List.from(json['research_components'] ?? [])
        .map((e) => ResearchComponent.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['lecture'] = lecture;
    _data['title'] = title;
    _data['description'] = description;
    _data['research_duration'] = research_duration;
    _data['research_type'] = research_type;
    _data['research_field'] = research_field;
    _data['research_start_date_time'] = research_start_date_time;
    _data['research_end_date_time'] = research_end_date_time;
    _data['research_cover'] = research_cover;
    _data['research_dates'] = research_dates.map((e) => e.toJson()).toList();
    ;
    _data['research_components'] =
        research_components.map((e) => e.toJson()).toList();
    ;
    _data['location'] = location;
    _data['guide_book'] = guide_book;
    return _data;
  }
}
