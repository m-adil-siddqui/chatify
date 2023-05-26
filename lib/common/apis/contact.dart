import 'package:chatify/common/entities/entities.dart';
import 'package:chatify/common/utils/utils.dart';

class ContactAPI {

  static Future<ContactResponseEntity> post_contact() async {
    var response = await HttpUtil().post(
      '/api/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }


}
