import 'package:mvvm_shop/data/network/error_hadler.dart';
import 'package:mvvm_shop/data/to_domain_model/responses.dart';

const String detailsDataKey = 'Details';
const String homeDataKey = 'Home';
const int validIntervalInMilleSeconds = 3000;

abstract class LocalDataSource {
  DomainBunchOfServicesRes getHomeData();
  DomainDetailsRes getDetailsData();
  saveHomeData(DomainBunchOfServicesRes data);
  saveDetailsData(DomainDetailsRes data);
  clearAllData();
  clearData(String dataKey);
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CashedItem> cachedData = Map();
  @override
  clearAllData() {
    cachedData = Map();
  }

  @override
  clearData(String dataKey) {
    cachedData.remove(dataKey);
  }

  @override
  DomainDetailsRes getDetailsData() {
    CashedItem? detailsData = cachedData[detailsDataKey];
    if (detailsData != null && detailsData.isValid()) {
      return detailsData.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  DomainBunchOfServicesRes getHomeData() {
    CashedItem? homeData = cachedData[homeDataKey];
    print(homeData?.isValid());

    if (homeData != null && homeData.isValid()) {
      return homeData.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  saveDetailsData(DomainDetailsRes data) {
    cachedData[detailsDataKey] = CashedItem(data);
  }

  @override
  saveHomeData(DomainBunchOfServicesRes data) {
    cachedData[homeDataKey] = CashedItem(data);
  }
}

class CashedItem {
  dynamic data;
  int initTime = DateTime.now().millisecondsSinceEpoch;
  CashedItem(this.data);
}

extension IsValidData on CashedItem {
  bool isValid() {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    int createdTime = initTime;
    print(initTime);
    print(currentTime);
    bool _isValid = (currentTime - createdTime) <= validIntervalInMilleSeconds;
    return _isValid;
  }
}
