import 'dart:io';

/**
 * @描述 文件解/压缩
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019/6/13
 *
 */
import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class FileZipDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FileZipDemoState();
  }
}

class _FileZipDemoState extends State<FileZipDemo> {
  String _zipRootPath = "空";
  TextEditingController _zipNameController = new TextEditingController();
  TextEditingController _unZipNameController = new TextEditingController();
  int _tag; //0表示解压、1表示压缩

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRootPath();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("文件解/压缩"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("手机存储根目录："),
            Text(
              _zipRootPath,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text("1、输入手机存储根目录下的需要解压的文件名称"),
            _getZipNameView(0),
            _getQueryBtnView(0),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text("2、输入手机存储根目录下的需要压缩的文件名称"),
            _getZipNameView(1),
            _getQueryBtnView(1),
          ],
        ),
      ),
    );
  }

  _getZipNameView(int tag) {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: tag == 0 ? _unZipNameController : _zipNameController,
      decoration: InputDecoration(
        hintText: tag == 0 ? "压缩包文件名称 格式如：test.zip" : "待压缩文件名称 格式如：test",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getQueryBtnView(int tag) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
          onPressed: () async {
            //需要存储权限
            if (await Permission.storage.request().isGranted) {
              //开始解压或压缩
              tag == 0 ? _unZip() : _zip();
            }

            // You can request multiple permissions at once.
            // Map<Permission, PermissionStatus> statuses = await [
            //   Permission.storage,
            // ].request();
            // print(statuses[Permission.storage]);
          },
          child: Text(
            tag == 0 ? "解压" : "压缩",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }

  ///解压
  void _unZip() async {
    if (_unZipNameController.text == null || _unZipNameController.text == "") {
      Fluttertoast.showToast(msg: "压缩包文件名称不能为空！");
      return;
    }
    String zipFilePath = _zipRootPath + "/" + _unZipNameController.text;
    if (!File(zipFilePath).existsSync()) {
      Fluttertoast.showToast(msg: "压缩包文件不存在！");
      return;
    }

    // 从磁盘读取Zip文件。
    List<int> bytes = File(zipFilePath).readAsBytesSync();
    // 解码Zip文件
    Archive archive = ZipDecoder().decodeBytes(bytes);

    // 将Zip存档的内容解压缩到磁盘。
    for (ArchiveFile file in archive) {
      if (file.isFile) {
        List<int> data = file.content;
        File(_zipRootPath + "/" + file.name)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(_zipRootPath + "/" + file.name)..create(recursive: true);
      }
    }
    Fluttertoast.showToast(msg: "解压成功");
    print("解压成功");
  }

  ///压缩
  void _zip() async {
    if (_zipNameController.text == null || _zipNameController.text == "") {
      Fluttertoast.showToast(msg: "待压缩文件名称不能为空！");
      return;
    }
    String directory = _zipRootPath + "/" + _zipNameController.text;
    if (!Directory(directory).existsSync()) {
      Fluttertoast.showToast(msg: "待压缩文件不存在！");
      return;
    }

    // Zip a directory to out.zip using the zipDirectory convenience method
    //使用zipDirectory方法将目录压缩到xxx.zip
    var encoder = ZipFileEncoder();
    encoder.zipDirectory(Directory(directory), filename: directory + ".zip");
    Fluttertoast.showToast(msg: "压缩成功");
    //手动创建目录和单个文件的zip。
//    encoder.create('out2.zip');
//    encoder.addDirectory(Directory('out'));
//    encoder.addFile(File('test.zip'));
//    encoder.close();
  }

  void _getRootPath() async {
    String pathStr = (await getExternalStorageDirectory()).path;
    setState(() {
      _zipRootPath = pathStr;
    });
  }
}
