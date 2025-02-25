import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_protect/config.dart';
import 'package:qr_protect/utilities/logger.dart';

final Dio _dio = GetIt.I<Dio>();

Future<String?> uploadImage(PlatformFile image)async{
  try{
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        image.path!,
        filename: image.name,
      )
    });
    
    Response response = await _dio.post("${UrlConfig.baseurl}/upload/", data: formData);
    CustomLogger.info(response.data.toString());
    return response.data.toString();
  }catch(e){
    CustomLogger.error(e);
    return null;
  }
}