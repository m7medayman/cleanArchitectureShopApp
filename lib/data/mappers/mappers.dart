import 'package:mvvm_shop/app/extensions.dart';
import 'package:mvvm_shop/data/responses/responses.dart';

import '../../model/models.dart';

extension CustomerMapper on CustomerRes? {
  Customer toDomain() {
    return Customer(this?.id.orEmpty() ?? '', this?.name.orEmpty() ?? '',
        this?.numberOfNotifications.orZero() ?? 0);
  }
}

extension ContactsMapper on ContactsRes? {
  Contacts toDomain() {
    return Contacts(this?.email.orEmpty() ?? '', this?.link.orEmpty() ?? '',
        this?.phone.orEmpty() ?? '');
  }
}

extension AuthenticationMapper on AuthenticationRes? {
  Authentication toDomain() {
    return Authentication(this?.contacts.toDomain(), this?.customer.toDomain());
  }
}

extension ApiMessageMapper on SimpleMessageRes? {
  ApiMessage toDomain() {
    return ApiMessage(this?.status.orZero(), this?.message.orEmpty());
  }
}
