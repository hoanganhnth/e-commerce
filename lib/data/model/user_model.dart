
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() =>
      UserModel(
          id: '',
          firstName: '',
          lastName: '',
          userName: '',
          email: '',
          phoneNumber: '',
          profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": userName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePicture,
    };
  }
  //
  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data();
  //     return UserModel(id: document.id,
  //         firstName: data['FirstName'] ?? '',
  //         lastName: data['FirstName'] ?? '',
  //         userName:  data['FirstName'] ?? '',
  //         data['FirstName'] ?? '',
  //         email: data['FirstName'] ?? '',
  //         phoneNumber: data['FirstName'] ?? '',
  //         profilePicture: data['FirstName'] ?? '')
  //   }
  // }
}
