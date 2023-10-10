class ResearchList {
  ResearchList({
    required this.status,
    required this.message,
    required this.data,
  });

  late final int status;
  late final String message;
  late final List<Data> data;

  ResearchList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
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

  Data.fromJson(Map<String, dynamic> json) {
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

class ResearchDate {
  ResearchDate({
    required this.date,
    required this.research_times,
  });

  late final String date;
  late final List<ResearchTime> research_times;

  ResearchDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    final researchTimes = json['data'];
    if (researchTimes != null) {
      research_times = List.from(researchTimes)
          .map((e) => ResearchTime.fromJson(e))
          .toList();
    } else {
      research_times = []; // Initialize as an empty list if 'data' is null
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['research_times'] = research_times.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ResearchTime {
  ResearchTime({
    required this.research_time,
  });

  late final String research_time;

  ResearchTime.fromJson(Map<String, dynamic> json) {
    research_time = json['research_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['research_time'] = research_time;
    return _data;
  }
}

class ResearchComponent {
  ResearchComponent({
    required this.name,
    required this.work_principle,
    required this.tools,
    required this.steps,
  });

  late final String name;
  late final String work_principle;
  late final String tools;
  late final String steps;

  ResearchComponent.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    work_principle = json['work_principle'];
    tools = json['tools'];
    steps = json['steps'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['work_principle'] = work_principle;
    _data['tools'] = tools;
    _data['steps'] = steps;
    return _data;
  }
}
