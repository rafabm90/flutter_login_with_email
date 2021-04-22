import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable{

  final String uid;
  final String email;
  final String photoURL;
  final String name;

  const LoggedUser({
    this.uid,
    this.email,
    this.photoURL,
    this.name,
  });

  @override
  List<Object> get props => [uid, email, photoURL,name];

}