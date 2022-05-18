import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().withLength(min: 1, max: 500)();
  TextColumn get title => text().nullable()();
  TextColumn get image => text().withLength()();
  TextColumn get uploaderName => text().withLength(min: 1, max: 100)();
  TextColumn get uploaderDescription => text().withLength(min: 1, max: 500)();
  IntColumn get price => integer()();
  TextColumn get district => text().withLength(min: 1, max: 40)();
  TextColumn get address => text().withLength(min: 1, max: 100)();
  TextColumn get votesCount => text().withLength(min: 1, max: 100)();
  BoolColumn get status => boolean().withDefault(const Constant(false))();
  TextColumn get files => text().nullable()();
  TextColumn get year => text().withDefault(const Constant('2022'))();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Projects])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Project>> getAllProjects() => select(projects).get();
  Stream<List<Project>> watchAllProjects() => select(projects).watch();
  Future insertProject(Insertable<Project> project) =>
      into(projects).insert(project);
  Future updateProject(Project project) => update(projects).replace(project);
  Future deleteProject(Project project) => delete(projects).delete(project);
  Future<List<Project>> getProjectsByDistrict(String district) =>
      (select(projects)
            ..where((p) {
              // String address = p.address.toString().split(',').removeAt(0);
              return p.district.equals(district);
            }))
          .get();
  Future<List<Project>> getProjectsByFilter(
    String year,
    String district,
    String category,
    double minPrice,
    double maxPrice,
  ) =>
      (select(projects)
            ..where(
              (p) =>
                  p.district.equals(district) &
                  p.price.isBiggerThanValue(minPrice.toInt()) &
                  p.price.isSmallerThanValue(maxPrice.toInt()) &
                  p.year.equals(year) &
                  p.uploaderDescription.equals(category),
            ))
          .get();
  Future<List<Project>> getProjectsWithoutCategory(
    String year,
    String district,
    double minPrice,
    double maxPrice,
  ) =>
      (select(projects)
            ..where(
              (p) =>
                  p.district.equals(district) &
                  p.price.isBiggerThanValue(minPrice.toInt()) &
                  p.price.isSmallerThanValue(maxPrice.toInt()) &
                  p.year.equals(year),
            ))
          .get();
}

// @DriftAccessor(tables: [Projects])
// class ProjectsDao extends DatabaseAccessor<AppDatabase>
//     with _$ProjectsDaoMixin {
//   final AppDatabase db;

//   ProjectsDao(this.db) : super(db);

//   Future<List<Project>> getAllProjects() => select(projects).get();
//   Stream<List<Project>> watchAllProjects() => select(projects).watch();
//   Future insertProject(Insertable<Project> project) async =>
//       await into(projects).insert(project);
//   Future updateProject(Insertable<Project> project) =>
//       update(projects).replace(project);
//   Future deleteProject(Insertable<Project> project) =>
//       delete(projects).delete(project);
// }
