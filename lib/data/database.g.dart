// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Project extends DataClass implements Insertable<Project> {
  final int id;
  final String description;
  final String? title;
  final String image;
  final String uploaderName;
  final String uploaderDescription;
  final String price;
  final String address;
  final String votesCount;
  final bool status;
  final String? files;
  Project(
      {required this.id,
      required this.description,
      this.title,
      required this.image,
      required this.uploaderName,
      required this.uploaderDescription,
      required this.price,
      required this.address,
      required this.votesCount,
      required this.status,
      this.files});
  factory Project.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Project(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      uploaderName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uploader_name'])!,
      uploaderDescription: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}uploader_description'])!,
      price: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address'])!,
      votesCount: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}votes_count'])!,
      status: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      files: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}files']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    map['image'] = Variable<String>(image);
    map['uploader_name'] = Variable<String>(uploaderName);
    map['uploader_description'] = Variable<String>(uploaderDescription);
    map['price'] = Variable<String>(price);
    map['address'] = Variable<String>(address);
    map['votes_count'] = Variable<String>(votesCount);
    map['status'] = Variable<bool>(status);
    if (!nullToAbsent || files != null) {
      map['files'] = Variable<String?>(files);
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      description: Value(description),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      image: Value(image),
      uploaderName: Value(uploaderName),
      uploaderDescription: Value(uploaderDescription),
      price: Value(price),
      address: Value(address),
      votesCount: Value(votesCount),
      status: Value(status),
      files:
          files == null && nullToAbsent ? const Value.absent() : Value(files),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      title: serializer.fromJson<String?>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      uploaderName: serializer.fromJson<String>(json['uploaderName']),
      uploaderDescription:
          serializer.fromJson<String>(json['uploaderDescription']),
      price: serializer.fromJson<String>(json['price']),
      address: serializer.fromJson<String>(json['address']),
      votesCount: serializer.fromJson<String>(json['votesCount']),
      status: serializer.fromJson<bool>(json['status']),
      files: serializer.fromJson<String?>(json['files']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'title': serializer.toJson<String?>(title),
      'image': serializer.toJson<String>(image),
      'uploaderName': serializer.toJson<String>(uploaderName),
      'uploaderDescription': serializer.toJson<String>(uploaderDescription),
      'price': serializer.toJson<String>(price),
      'address': serializer.toJson<String>(address),
      'votesCount': serializer.toJson<String>(votesCount),
      'status': serializer.toJson<bool>(status),
      'files': serializer.toJson<String?>(files),
    };
  }

  Project copyWith(
          {int? id,
          String? description,
          String? title,
          String? image,
          String? uploaderName,
          String? uploaderDescription,
          String? price,
          String? address,
          String? votesCount,
          bool? status,
          String? files}) =>
      Project(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        image: image ?? this.image,
        uploaderName: uploaderName ?? this.uploaderName,
        uploaderDescription: uploaderDescription ?? this.uploaderDescription,
        price: price ?? this.price,
        address: address ?? this.address,
        votesCount: votesCount ?? this.votesCount,
        status: status ?? this.status,
        files: files ?? this.files,
      );
  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('uploaderName: $uploaderName, ')
          ..write('uploaderDescription: $uploaderDescription, ')
          ..write('price: $price, ')
          ..write('address: $address, ')
          ..write('votesCount: $votesCount, ')
          ..write('status: $status, ')
          ..write('files: $files')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, title, image, uploaderName,
      uploaderDescription, price, address, votesCount, status, files);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.description == this.description &&
          other.title == this.title &&
          other.image == this.image &&
          other.uploaderName == this.uploaderName &&
          other.uploaderDescription == this.uploaderDescription &&
          other.price == this.price &&
          other.address == this.address &&
          other.votesCount == this.votesCount &&
          other.status == this.status &&
          other.files == this.files);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> description;
  final Value<String?> title;
  final Value<String> image;
  final Value<String> uploaderName;
  final Value<String> uploaderDescription;
  final Value<String> price;
  final Value<String> address;
  final Value<String> votesCount;
  final Value<bool> status;
  final Value<String?> files;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.uploaderName = const Value.absent(),
    this.uploaderDescription = const Value.absent(),
    this.price = const Value.absent(),
    this.address = const Value.absent(),
    this.votesCount = const Value.absent(),
    this.status = const Value.absent(),
    this.files = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.title = const Value.absent(),
    required String image,
    required String uploaderName,
    required String uploaderDescription,
    required String price,
    required String address,
    required String votesCount,
    this.status = const Value.absent(),
    this.files = const Value.absent(),
  })  : description = Value(description),
        image = Value(image),
        uploaderName = Value(uploaderName),
        uploaderDescription = Value(uploaderDescription),
        price = Value(price),
        address = Value(address),
        votesCount = Value(votesCount);
  static Insertable<Project> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<String?>? title,
    Expression<String>? image,
    Expression<String>? uploaderName,
    Expression<String>? uploaderDescription,
    Expression<String>? price,
    Expression<String>? address,
    Expression<String>? votesCount,
    Expression<bool>? status,
    Expression<String?>? files,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (uploaderName != null) 'uploader_name': uploaderName,
      if (uploaderDescription != null)
        'uploader_description': uploaderDescription,
      if (price != null) 'price': price,
      if (address != null) 'address': address,
      if (votesCount != null) 'votes_count': votesCount,
      if (status != null) 'status': status,
      if (files != null) 'files': files,
    });
  }

  ProjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<String?>? title,
      Value<String>? image,
      Value<String>? uploaderName,
      Value<String>? uploaderDescription,
      Value<String>? price,
      Value<String>? address,
      Value<String>? votesCount,
      Value<bool>? status,
      Value<String?>? files}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      title: title ?? this.title,
      image: image ?? this.image,
      uploaderName: uploaderName ?? this.uploaderName,
      uploaderDescription: uploaderDescription ?? this.uploaderDescription,
      price: price ?? this.price,
      address: address ?? this.address,
      votesCount: votesCount ?? this.votesCount,
      status: status ?? this.status,
      files: files ?? this.files,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (uploaderName.present) {
      map['uploader_name'] = Variable<String>(uploaderName.value);
    }
    if (uploaderDescription.present) {
      map['uploader_description'] = Variable<String>(uploaderDescription.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (votesCount.present) {
      map['votes_count'] = Variable<String>(votesCount.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    if (files.present) {
      map['files'] = Variable<String?>(files.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('uploaderName: $uploaderName, ')
          ..write('uploaderDescription: $uploaderDescription, ')
          ..write('price: $price, ')
          ..write('address: $address, ')
          ..write('votesCount: $votesCount, ')
          ..write('status: $status, ')
          ..write('files: $files')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _uploaderNameMeta =
      const VerificationMeta('uploaderName');
  @override
  late final GeneratedColumn<String?> uploaderName = GeneratedColumn<String?>(
      'uploader_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _uploaderDescriptionMeta =
      const VerificationMeta('uploaderDescription');
  @override
  late final GeneratedColumn<String?> uploaderDescription =
      GeneratedColumn<String?>('uploader_description', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 500),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String?> price = GeneratedColumn<String?>(
      'price', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _votesCountMeta = const VerificationMeta('votesCount');
  @override
  late final GeneratedColumn<String?> votesCount = GeneratedColumn<String?>(
      'votes_count', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<bool?> status = GeneratedColumn<bool?>(
      'status', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (status IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _filesMeta = const VerificationMeta('files');
  @override
  late final GeneratedColumn<String?> files = GeneratedColumn<String?>(
      'files', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        description,
        title,
        image,
        uploaderName,
        uploaderDescription,
        price,
        address,
        votesCount,
        status,
        files
      ];
  @override
  String get aliasedName => _alias ?? 'projects';
  @override
  String get actualTableName => 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<Project> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('uploader_name')) {
      context.handle(
          _uploaderNameMeta,
          uploaderName.isAcceptableOrUnknown(
              data['uploader_name']!, _uploaderNameMeta));
    } else if (isInserting) {
      context.missing(_uploaderNameMeta);
    }
    if (data.containsKey('uploader_description')) {
      context.handle(
          _uploaderDescriptionMeta,
          uploaderDescription.isAcceptableOrUnknown(
              data['uploader_description']!, _uploaderDescriptionMeta));
    } else if (isInserting) {
      context.missing(_uploaderDescriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('votes_count')) {
      context.handle(
          _votesCountMeta,
          votesCount.isAcceptableOrUnknown(
              data['votes_count']!, _votesCountMeta));
    } else if (isInserting) {
      context.missing(_votesCountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('files')) {
      context.handle(
          _filesMeta, files.isAcceptableOrUnknown(data['files']!, _filesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Project.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ProjectsTable projects = $ProjectsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [projects];
}
