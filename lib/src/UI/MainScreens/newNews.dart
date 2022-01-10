import 'dart:io';

import 'package:bashir_village/src/UI/MainWidgets/customBtn.dart';
import 'package:bashir_village/src/UI/MainWidgets/customDrawer.dart';
import 'package:bashir_village/src/UI/MainWidgets/customTextField.dart';
import 'package:bashir_village/src/UI/Notifications/notifications.dart';
// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class NewNews extends StatefulWidget {
  @override
  _NewNewsState createState() => _NewNewsState();//
}

class _NewNewsState extends State<NewNews> {
  List<DropdownMenuItem<String>> _dropDownMenuItemsCategory;
  String _currentCategory = '';
  File _mainImg;
  List<Asset> _multiImages = [];
  File _video;
  // ChewieController _controller;

  _pickVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    _video = video;
    // setState(() {
    //   _controller = ChewieController(
    //     videoPlayerController: VideoPlayerController.file(video),
    //     aspectRatio: 4 / 3,
    //     autoPlay: true,
    //     looping: true,
    //   );
    // });
  }

  _changedDropDownItemCategory(String selectedNationality) {
    setState(() {
      _currentCategory = selectedNationality;
    });
  }

  _getMainImg(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      _mainImg = image;
    });
  }

  Future<void> _loadAssets() async {
    setState(() {
      _multiImages = [];
    });

    List<Asset> resultList =
        await MultiImagePicker.pickImages(maxImages: 6, enableCamera: false);

    setState(() {
      _multiImages = resultList;
    });
  }

  Widget _showVideo() {
    if (_video != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            // Chewie(
            //   controller: _controller,
            // ),
            // Positioned(
            //   top: 10,
            //   left: 10,
            //   child: InkWell(
            //     onTap: () {
            //       setState(() {
            //         _video = null;
            //         _controller.pause();
            //       });
            //     },
            //     child: Icon(Icons.delete, color: Colors.red, size: 30),
            //   ),
            // ),
          ],
        ),
      );
    } else {
      return _cameraBtn(
          icon: Icons.video_library,
          label: 'إضافة فيديو',
          onTap: () {
            _pickVideo();
          });
    }
  }

  Widget _showMainImg() {
    if (_mainImg != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    _mainImg,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _mainImg = null;
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              bottom: 10,
              left: 10,
            ),
          ],
        ),
      );
    } else {
      return _cameraBtn(
          icon: Icons.camera_alt,
          label: 'الصورة الرئيسية',
          onTap: () {
            _getMainImg(ImageSource.gallery);
          });
    }
  }

  Widget _buildGridView() {
    if (_multiImages.length != 0) {
      return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          height: _multiImages.length > 3 ? 260 : 130,
          child: GridView.count(
            crossAxisCount: 3,
            physics: ScrollPhysics(),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: List.generate(_multiImages.length, (index) {
              Asset asset = _multiImages[index];
              return Stack(
                children: <Widget>[
                  AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  ),
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _multiImages.removeAt(index);
                        });
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    bottom: 5,
                    left: 5,
                  ),
                ],
              );
            }),
          ),
        ),
      );
    } else {
      return _cameraBtn(
          icon: Icons.camera_alt,
          label: 'صور إضافية',
          onTap: () {
            _loadAssets();
          });
    }
  }

  Widget _cameraBtn({Function onTap, String label, IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color.fromRGBO(220, 220, 220, 1))),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Icon(icon), Text(label)],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاخبار"),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Notifications())),
          child: Icon(Icons.notifications),
        ),
      ),
      endDrawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          CustomTextField(
            icon: Icons.label,
            hint: "",
            maxLines: 1,
            label: 'عنوان الخبر',
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 5),
            child: Text(
              'القسم',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 1),
            ),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      '-- إختر القسم --',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    value: _currentCategory,
                    items: _dropDownMenuItemsCategory,
                    onChanged: _changedDropDownItemCategory,
                  ),
                )),
          ),
          SizedBox(height: 20),
          CustomTextField(
            icon: Icons.edit,
            hint: "",
            maxLines: 5,
            label: 'مضمون الخبر',
          ),
          SizedBox(height: 20),
          _showMainImg(),
          SizedBox(height: 20),
          _buildGridView(),
          SizedBox(height: 20),
          _showVideo(),
          SizedBox(height: 20),
          CustomBtn(
            color: Theme.of(context).primaryColor,
            onTap: () {},
            text: 'إرسال الخبر',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
