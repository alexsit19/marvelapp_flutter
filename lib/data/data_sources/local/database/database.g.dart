// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CharacterTableData extends DataClass
    implements Insertable<CharacterTableData> {
  final int? id;
  final String? name;
  final String? thumbnailUrl;
  CharacterTableData({this.id, this.name, this.thumbnailUrl});
  factory CharacterTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CharacterTableData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      thumbnailUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String?>(thumbnailUrl);
    }
    return map;
  }

  CharacterTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
    );
  }

  factory CharacterTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterTableData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
    };
  }

  CharacterTableData copyWith({int? id, String? name, String? thumbnailUrl}) =>
      CharacterTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, thumbnailUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.thumbnailUrl == this.thumbnailUrl);
}

class CharacterTableCompanion extends UpdateCompanion<CharacterTableData> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> thumbnailUrl;
  const CharacterTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
  });
  CharacterTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
  });
  static Insertable<CharacterTableData> custom({
    Expression<int?>? id,
    Expression<String?>? name,
    Expression<String?>? thumbnailUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
    });
  }

  CharacterTableCompanion copyWith(
      {Value<int?>? id, Value<String?>? name, Value<String?>? thumbnailUrl}) {
    return CharacterTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String?>(thumbnailUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }
}

class $CharacterTableTable extends CharacterTable
    with TableInfo<$CharacterTableTable, CharacterTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String?> thumbnailUrl = GeneratedColumn<String?>(
      'thumbnail_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, thumbnailUrl];
  @override
  String get aliasedName => _alias ?? 'character_table';
  @override
  String get actualTableName => 'character_table';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CharacterTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CharacterTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CharacterTableTable createAlias(String alias) {
    return $CharacterTableTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CharacterTableTable characterTable = $CharacterTableTable(this);
  late final CharacterDao characterDao = CharacterDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [characterTable];
}
