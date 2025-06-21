import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/exceptions.dart';

/// A professional service class to interact with Supabase DB
class SupabaseDatabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  /// جلب جميع الصفوف من جدول معين
  Future<List<Map<String, dynamic>>> fetchAll(String table) async {
    try {
      final response = await _client.from(table).select();
      return (response as List).cast<Map<String, dynamic>>();
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'فشل في جلب البيانات من "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'خطأ غير متوقع أثناء جلب البيانات من "$table"',
      );
    }
  }

  /// إضافة صف جديد إلى الجدول
  Future<void> insertRow({
    required String table,
    required Map<String, dynamic> values,
  }) async {
    try {
      await _client.from(table).insert(values);
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'فشل في إضافة صف إلى "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'خطأ غير متوقع أثناء إضافة صف إلى "$table"',
      );
    }
  }

  /// تحديث صف معين في الجدول باستخدام [id] كمعرف رئيسي
  Future<void> updateRow({
    required String table,
    required int id,
    required Map<String, dynamic> values,
  }) async {
    try {
      await _client.from(table).update(values).eq('id', id);
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'فشل في تحديث الصف في "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'خطأ غير متوقع أثناء تحديث البيانات في "$table"',
      );
    }
  }

  /// حذف صف معين من الجدول باستخدام [id] كمعرف رئيسي
  Future<void> deleteRow({required String table, required int id}) async {
    try {
      await _client.from(table).delete().eq('id', id);
    } on PostgrestException catch (e) {
      debugPrint('[Supabase ERROR] ${e.message}');
      throw CustomException(
        message: 'فشل في حذف الصف من "$table": ${e.message}',
      );
    } catch (e, st) {
      debugPrint('[Unexpected ERROR] $e');
      debugPrint('$st');
      throw CustomException(
        message: 'خطأ غير متوقع أثناء حذف الصف من "$table"',
      );
    }
  }
}
