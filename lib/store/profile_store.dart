import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class QYProfileStore extends ChangeNotifier {
  XFile? _avatarImg;

  XFile? get avatarImg => _avatarImg;

  set avatarImg(XFile? value) {
    _avatarImg = value;
  } // 头像文件
}
