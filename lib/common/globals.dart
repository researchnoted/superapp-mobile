import 'package:superapp_mobile/data/source/remote/model/research/researchList.dart';

String authToken = ''; // Initialize it as an empty string
String authRole = '';
String regisRole = '';
String selectedStartDateResearch = '';
String selectedEndDateResearch = '';

// Used when uploading new research
String idCurrentCreated = '';
var selectedComponents = [];
var selectedDates = [];
var selectedTimes = [];

ResearchList researchs =
    ResearchList(status: 200, message: 'Default Message', data: []);
