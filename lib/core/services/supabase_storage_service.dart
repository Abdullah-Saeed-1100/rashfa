import 'dart:math';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';
import 'dart:developer' as dev;
import '../errors/exceptions.dart';

class SupabaseStorageService {
  final Supabase _supabase = Supabase.instance;

  // ==================== >> Upload File << ====================
  Future<String> uploadFile({
    required File file,
    required String path,
    required String bucket,
  }) async {
    try {
      final random = Random().nextInt(9000) + 1000;
      final fileName = '$random${file.path.split('/').last.split('.').first}';

      await _supabase.client.storage
          .from(bucket)
          .upload('$path$fileName', file); // upload the file to the storage
      final filePublicUrl = _supabase.client.storage
          .from(bucket)
          .getPublicUrl('$path$fileName'); // get the download URL of the file

      return filePublicUrl; // return the download URL like this: https://storage.supabase.co/v1/storage/v1/object/public/fruits/images/your_image.png
    } on StorageException catch (e) {
      dev.log(
        "Exception in SupabaseStorageService.uploadFile: ${e.toString()} and code is ${e.message}",
      );
      if (e.statusCode == "403") {
        throw CustomException(message: "غير مصرح لك برفع هذا الملف.");
      }
      if (e.statusCode == "409") {
        throw CustomException(message: "الملف موجود بالفعل.");
      } else if (e.message == 'Network error') {
        throw CustomException(message: "تأكد من اتصالك بالإنترنت.");
      } else {
        throw CustomException(message: "حدث خطأ غير معروف.");
      }
    } catch (e) {
      dev.log(
        "Exception in SupabaseStorageService.uploadFile: ${e.toString()}",
      );
      throw CustomException(message: "حدث خطأ غير معروف.");
    }
  }

  // ==================== >> Get URL File << ====================
  Future<String> getUrlFile({
    required String path,
    required String bucket,
  }) async {
    try {
      final fileUrl = _supabase.client.storage
          .from(bucket)
          .getPublicUrl(path); // get the download URL of the file

      return fileUrl; // return the download URL like this: https://storage.supabase.co/v1/storage/v1/object/public/fruits/images/your_image.png
    } on StorageException catch (e) {
      dev.log(
        "Exception in SupabaseStorageService.getUrlFile: ${e.toString()} and code is ${e.message}",
      );
      throw CustomException(message: "حدث خطأ غير معروف.");
    } catch (e) {
      dev.log(
        "Exception in SupabaseStorageService.getUrlFile: ${e.toString()}",
      );
      throw CustomException(message: "حدث خطأ غير معروف.");
    }
  }
}
