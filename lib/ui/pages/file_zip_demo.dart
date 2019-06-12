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

class FileZipDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FileZipDemoState();
  }

}

class _FileZipDemoState extends State<FileZipDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("文件解/压缩"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }


  void _zip(){
    // 从磁盘读取Zip文件。
    List<int> bytes = File('test.zip').readAsBytesSync();

    // 解码Zip文件
    Archive archive = ZipDecoder().decodeBytes(bytes);

    // 将Zip存档的内容解压缩到磁盘。
    for (ArchiveFile file in archive) {
      String filename = file.name;
      if (file.isFile) {
        List<int> data = file.content;
        File('out/' + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('out/' + filename)
          ..create(recursive: true);
      }
    }

    // 将存档编码为BZip2压缩的Tar文件。
    List<int> tar_data = TarEncoder().encode(archive);
    List<int> tar_bz2 = BZip2Encoder().encode(tar_data);

    // 将压缩的tar文件写入磁盘。
    File fp = File('test.tbz');
    fp.writeAsBytesSync(tar_bz2);

    // Zip a directory to out.zip using the zipDirectory convenience method
    //使用zipDirectory方便方法将目录压缩到out.zip
    var encoder = ZipFileEncoder();
    encoder.zipDirectory(Directory('out'), filename: 'out.zip');

    //手动创建目录和单个文件的zip。
    encoder.create('out2.zip');
    encoder.addDirectory(Directory('out'));
    encoder.addFile(File('test.zip'));
    encoder.close();
  }


}