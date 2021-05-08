import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'education_record.g.dart';

abstract class EducationRecord
    implements Built<EducationRecord, EducationRecordBuilder> {
  static Serializer<EducationRecord> get serializer =>
      _$educationRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Image')
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EducationRecordBuilder builder) =>
      builder..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Education');

  static Stream<EducationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EducationRecord._();
  factory EducationRecord([void Function(EducationRecordBuilder) updates]) =
      _$EducationRecord;
}

Map<String, dynamic> createEducationRecordData({
  String image,
}) =>
    serializers.serializeWith(
        EducationRecord.serializer, EducationRecord((e) => e..image = image));

EducationRecord get dummyEducationRecord {
  final builder = EducationRecordBuilder()..image = dummyImagePath;
  return builder.build();
}

List<EducationRecord> createDummyEducationRecord({int count}) =>
    List.generate(count, (_) => dummyEducationRecord);
