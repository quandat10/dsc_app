import 'dart:convert';

import 'package:http/http.dart' as http;

class DeviceEntryApi {
  Future<bool> getDeviceFirstEntryCheck({required String deviceID}) async {
    var request = http.Request('GET',
        Uri.parse('http://188.166.219.131:8000/api/v1/devices/$deviceID'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = json.decode(await response.stream.bytesToString());
      if (data['status'] == 200) {
        print('hey');
        return data['result']['firstEntry'] as bool;
      }
    } else {
      print(response.reasonPhrase);
    }
    return true;
  }

  Future<void> updateDeviceFirstEntryCheck({required String deviceID}) async {
    var request = http.Request('POST', Uri.parse('http://188.166.219.131:8000/api/v1/devices'));
    request.body = json.encode({
      "deviceId": deviceID,
      "firstEntry": false
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
}
