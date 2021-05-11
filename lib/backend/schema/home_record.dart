import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'home_record.g.dart';

abstract class HomeRecord implements Built<HomeRecord, HomeRecordBuilder> {
  static Serializer<HomeRecord> get serializer => _$homeRecordSerializer;

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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HomeRecordBuilder builder) => builder
    ..image = ''
    ..detailsText = ''
    ..trailerVideo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Home');

  static Stream<HomeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HomeRecord._();
  factory HomeRecord([void Function(HomeRecordBuilder) updates]) = _$HomeRecord;
}

Map<String, dynamic> createHomeRecordData({
  String image,
  String detailsText,
  String trailerVideo,
}) =>
    serializers.serializeWith(
        HomeRecord.serializer,
        HomeRecord((h) => h
          ..image = image
          ..detailsText = detailsText
          ..trailerVideo = trailerVideo));

HomeRecord get dummyHomeRecord {
  final builder = HomeRecordBuilder()
    ..image = dummyImagePath
    ..detailsText = dummyString
    ..trailerVideo = dummyVideoPath;
  return builder.build();
}

List<HomeRecord> createDummyHomeRecord({int count}) =>
    List.generate(count, (_) => dummyHomeRecord);
