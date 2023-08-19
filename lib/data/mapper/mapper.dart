import 'package:tut_app/data/response/responses.dart';
import 'package:tut_app/app/extensions.dart';
import 'package:tut_app/domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse{
  Customer toDomain() {
    return Customer(
      id: id.onNull(),
      name: name.onNull(),
      numOfNotifications: numOfNotifications.onNull(),
    );
  }
}

extension ContactsResponseMapper on ContactsResponse{
  Contacts toDomain() {
    return Contacts(
      phone: phone.onNull(),
      email: email.onNull(),
      link: link.onNull(),
    );
  }
}

extension AuthResponseMapper on AuthResponse{
  Authentication toDomain() {
    return Authentication(
      customer: customer?.toDomain(),
      contacts: contacts?.toDomain(),
    );
  }
}