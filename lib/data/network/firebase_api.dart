import 'package:dio/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_shop/app/constants.dart';
import 'package:mvvm_shop/app/extensions.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';
import 'package:mvvm_shop/data/requests/requests_body.dart';
import 'package:mvvm_shop/data/responses/responses.dart';
import 'package:retrofit/http.dart';

part 'firebase_api.g.dart';

@RestApi(baseUrl: AppConstants.fireStore)
abstract class FireBaseServiceClient {
  factory FireBaseServiceClient(Dio dio, {String baseUrl}) =
      _FireBaseServiceClient;
  @PATCH("users/{userId}")
  Future<UserProfileRes> postUserProfile(
      @Path("userId") String userId, @Body() data);
}

class DataServiceClient {
  CollectionReference services =
      FirebaseFirestore.instance.collection('services');
  Future<BunchOfServicesRes> fetchHomeServices() async {
    DocumentReference serviceRef = await services.doc('home_view');
    List<DomainServiceRes> bunchOfServices = [];
    DocumentSnapshot doc = await serviceRef.get();
    if (doc.exists) {
      print(doc.data());
      Map<String, dynamic> servicesMap = (doc.data()!) as Map<String, dynamic>;
      servicesMap.forEach((key, value) {
        var s = DomainServiceRes(
            name: value['name'] ?? "",
            imageUrl: value['image'] ?? "",
            id: value['id']);
        bunchOfServices.add(s);
      });
    }
    return BunchOfServicesRes(bunchOfServices);
  }

  Future<DetailsRes> fetchDetails(String id) async {
    DocumentReference serviceRef = services.doc(id);
    DocumentSnapshot doc = await serviceRef.get();
    if (doc.exists) {
      var data = doc.data() as Map;
      return DetailsRes(
          imageUrl: data['imageUrl'] ?? '',
          details: data['details'] ?? '',
          services: data['services'] ?? '',
          aboutStore: data['aboutStore'] ?? '');
    } else {
      throw Exception('doc is not exist');
    }
  }
}
