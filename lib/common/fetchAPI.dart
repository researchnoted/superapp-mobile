import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:superapp_mobile/common/baseUrl.dart';
import 'package:superapp_mobile/common/globals.dart';
import 'package:http/http.dart' as http;

// CREATE RESEARCH PAGE

// POST RESEARCH
Future<void> postResearch(
    titleController,
    descriptionController,
    locationController,
    typeController,
    fieldController,
    startDateResearchController,
    endDateResearchController) async {
  try {
    final response = await http.post(
      Uri.parse('$urlAPI/researchs'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      body: {
        'title': titleController,
        'description': descriptionController,
        'location': locationController,
        'start_date_time_research': startDateResearchController,
        'end_date_time_research': endDateResearchController,
        'research_type': typeController,
        'research_field': fieldController,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      Logger().d("postResearch : $responseData");
      idCurrentCreated = responseData['data']['id'];
      Logger().d("DATE : $selectedStartDateResearch");
    } else {
      Logger().e(response.body);
      Logger().e('Post failed');
    }
  } catch (e) {
    Logger().e('Error: $e');
  }
}

// POST COMPONENTS RESEARCH
Future<void> postResearchComponent(name) async {
  try {
    final response =
        await http.post(Uri.parse('$urlAPI/researchs/components'), headers: {
      'Authorization': 'Bearer $authToken'
    }, body: {
      'research_id': idCurrentCreated,
      'name': name,
      'work_principle': 'default',
      'tools': 'default',
      'steps': 'default'
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      Logger().d("postResearch : $responseData");
    } else {
      Logger().e(response.body);
      Logger().e('Post failed');
    }
  } catch (e) {
    Logger().e('Error: $e');
  }
}

// UPLOAD RESEARCH GUIDEBOOK
Future<void> uploadGuideBookResearch(_selectedFile) async {
  try {
    if (_selectedFile == null) {
      // No file selected, handle this case as needed
      return;
    }

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$urlAPI/researchs/$idCurrentCreated/guide-book'),
    );

    // Attach the file to the request
    request.files.add(
      await http.MultipartFile.fromPath(
        'guide_book', // Field name for the file
        _selectedFile.path,
      ),
    );

    // Add authorization header if needed
    request.headers['Authorization'] = 'Bearer $authToken';

    // Send the request
    var response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final decodedResponse = json.decode(responseData);
      Logger().d("File upload successful: $decodedResponse");
    } else {
      Logger().e('File upload failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    Logger().e('Error uploading file: $e');
  }
}

// UPLOAD NFC CODE
Future<void> uploadNfcCode(nfcCode) async {
  try {
    final response = await http.post(
      Uri.parse('$urlAPI/researchs/$idCurrentCreated/nfc-code'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: jsonEncode({'nfc_code': nfcCode.toString()}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("NFC code upload successful: $responseData");
    } else {
      print('NFC code upload failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading NFC code: $e');
  }
}
