import 'package:image_picker/image_picker.dart';
import 'function_response.dart';
import 'package:flutter/material.dart';

import '../service_locator.dart';

enum ImageType { network, file, asset, unknown }

class CustomImageHelper {
  ImageType getImageType(String _imagePath) {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      final String _leftSubstring = _imagePath.substring(0, 8).toLowerCase();

      print('Image extension : $_leftSubstring');

      if (_leftSubstring.contains('http')) {
        _fResponse.data = ImageType.network;
      } else if (_leftSubstring.contains('data')) {
        _fResponse.data = ImageType.file;
      } else if (_leftSubstring.contains('asset')) {
        _fResponse.data = ImageType.asset;
      } else {
        _fResponse.data = ImageType.unknown;
      }
      _fResponse.passed();
      _fResponse.message = 'Found image type';
    } catch (e) {
      _fResponse.failed();
      _fResponse.message = 'Error finding image type';
    }

    return _fResponse.data;
  }

  Future<FunctionResponse> pickUserImage(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    final ThemeData theme = Theme.of(context);
    String _pickedImage = '';
    final ImagePicker _picker = ImagePicker();
    await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                'Select an Image',
                style: theme.textTheme.headline3,
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      final XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                          maxWidth: 150);
                      if (image == null) {
                        _pickedImage = '';

                        _fResponse.message = 'Image not picked';

                        Navigator.of(context).pop();
                      } else {
                        _pickedImage = image.path;

                        _fResponse.passed();
                        _fResponse.data = _pickedImage;
                        _fResponse.message = 'Image picked From gallery';

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Open Gallery',
                      style: theme.textTheme.headline4,
                    )),
                TextButton(
                    onPressed: () async {
                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);
                      if (photo == null) {
                        _pickedImage = '';

                        _fResponse.message = 'Image not captured';

                        Navigator.of(context).pop();
                        return;
                      } else {
                        _pickedImage = photo.path;

                        _fResponse.passed();
                        _fResponse.data = _pickedImage;
                        _fResponse.message = 'Image captured with Camera';

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Capture',
                      style: theme.textTheme.headline4,
                    )),
              ],
            ));

    return _fResponse;
  }
}
