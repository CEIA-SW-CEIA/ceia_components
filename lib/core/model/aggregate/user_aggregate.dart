import 'package:ceia_components/core/model/system_entity/person.dart';
import 'package:ceia_components/core/model/system_entity/profile.dart';
import 'package:ceia_components/core/model/system_entity/user.dart';

class UserAggregate {
  final User user;
  final Person person;
  final List<Profile> profileList;

  UserAggregate._({
    required this.user,
    required this.person,
    required this.profileList,
  });

  factory UserAggregate.fromDependencies(User user, Person person, List<Profile> profileList) {
    return UserAggregate._(
      user: user,
      person: person,
      profileList: profileList,
    );
  }

  Map<String, dynamic> toCache() {
    return {
      'user': user.toCache(),
      'person': person.toCache(),
      'profileList': profileList.map((profile) => profile.toCache()).toList(),
    };
  }

  factory UserAggregate.fromCache(Map<String, dynamic> cache) {
    return UserAggregate._(
      user: User.fromCache(cache['user']),
      person: Person.fromCache(cache['person']),
      profileList: (cache['profileList'] as List).map((profile) => Profile.fromCache(profile)).toList(),
    );
  }
}
