import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'movies_record.g.dart';

abstract class MoviesRecord
    implements Built<MoviesRecord, MoviesRecordBuilder> {
  static Serializer<MoviesRecord> get serializer => _$moviesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Images')
  String get images;

  @nullable
  @BuiltValueField(wireName: 'DetailsText')
  String get detailsText;

  @nullable
  @BuiltValueField(wireName: 'Watch')
  String get watch;

  @nullable
  @BuiltValueField(wireName: 'TrailerVideo')
  String get trailerVideo;

  @nullable
  @BuiltValueField(wireName: 'LinkForBook')
  String get linkForBook;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MoviesRecordBuilder builder) => builder
    ..images = ''
    ..detailsText = ''
    ..watch = ''
    ..trailerVideo = ''
    ..linkForBook = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Movies');

  static Stream<MoviesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MoviesRecord._();
  factory MoviesRecord([void Function(MoviesRecordBuilder) updates]) =
      _$MoviesRecord;
}

Map<String, dynamic> createMoviesRecordData({
  String images,
  String detailsText,
  String watch,
  String trailerVideo,
  String linkForBook,
}) =>
    serializers.serializeWith(
        MoviesRecord.serializer,
        MoviesRecord((m) => m
          ..images = images
          ..detailsText = detailsText
          ..watch = watch
          ..trailerVideo = trailerVideo
          ..linkForBook = linkForBook));

MoviesRecord get dummyMoviesRecord {
  final builder = MoviesRecordBuilder()
    ..images = dummyImagePath
    ..detailsText = dummyString
    ..watch = dummyVideoPath
    ..trailerVideo = dummyVideoPath
    ..linkForBook = dummyString;
  return builder.build();
}

List<MoviesRecord> createDummyMoviesRecord({int count}) =>
    List.generate(count, (_) => dummyMoviesRecord);
