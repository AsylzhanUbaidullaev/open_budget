import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
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
  TextColumn get price => text().withLength(min: 1, max: 30)();
  TextColumn get address => text().withLength(min: 1, max: 100)();
  TextColumn get votesCount => text().withLength(min: 1, max: 100)();
  BoolColumn get status => boolean().withDefault(const Constant(false))();
  TextColumn get files => text().nullable()();
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
