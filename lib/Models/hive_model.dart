// ignore_for_file: public_member_api_docs

import 'package:hive/hive.dart';

part '../Adapters/hive_model.g.dart';

@HiveType(typeId: 1)
class PersonDetails {
  PersonDetails({required this.firstname});

  @HiveField(0)
   String firstname;


}
