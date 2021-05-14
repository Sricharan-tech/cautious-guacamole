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
  @BuiltValueField(wireName: 'DetailsText')
  String get detailsText;

  @nullable
  @BuiltValueField(wireName: 'TrailerVideo')
  String get trailerVideo;

  @nullable
  @BuiltValueField(wireName: 'Watch')
  String get watch;

  @nullable
  @BuiltValueField(wireName: 'LinkForBook')
  String get linkForBook;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EducationRecordBuilder builder) => builder
    ..image = ''
    ..detailsText = ''
    ..trailerVideo = ''
    ..watch = ''
    ..linkForBook = '';

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
  String detailsText,
  String trailerVideo,
  String watch,
  String linkForBook,
}) =>
    serializers.serializeWith(
        EducationRecord.serializer,
        EducationRecord((e) => e
          ..image = image
          ..detailsText = detailsText
          ..trailerVideo = trailerVideo
          ..watch = watch
          ..linkForBook = linkForBook));

EducationRecord get dummyEducationRecord {
  final builder = EducationRecordBuilder()
    ..image = dummyImagePath
    ..detailsText = dummyString
    ..trailerVideo = dummyVideoPath
    ..watch = dummyVideoPath
    ..linkForBook = dummyString;
  return builder.build();
}

List<EducationRecord> createDummyEducationRecord({int count}) =>
    List.generate(count, (_) => dummyEducationRecord);
