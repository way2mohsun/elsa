import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Download extends StatefulWidget {
  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  final String url =
      'https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2020/07/solar_orbiter_s_first_views_of_the_sun4/22133246-1-eng-GB/Solar_Orbiter_s_first_views_of_the_Sun.jpg';

  var progress = '';
  String file = '';
  bool downloading = false;

  Future<void> downloadFile() async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      file = '${dir.path}/img.jpg';
      print(file);
      await dio.download(url, '${dir.path}/img.jpg',
          onReceiveProgress: (rec, total) {
        //print('rec : $rec -  total : $total');
        setState(() {
          downloading = true;
          progress = (rec / total * 100).toStringAsFixed(0) + ' %';
        });
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      downloading = false;
      progress = 'Completed';
    });
  }

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download'),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          child: Card(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                downloading
                    ? CircularProgressIndicator()
                    : Container(
                        child: Image.asset(
                          '/var/mobile/Containers/Data/Application/B0D68656-1542-4235-A0DD-F1385E6F65D7/Documents/img.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(height: 20),
                Text(
                  'Downloading file : $progress',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
