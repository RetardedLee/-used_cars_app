class CityModel {
  List<CityLabel> allCityList;
  List<City> hotCityList;

  CityModel({this.allCityList, this.hotCityList});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['allCityList'] != null) {
      allCityList = new List<CityLabel>();
      json['allCityList'].forEach((v) {
        allCityList.add(new CityLabel.fromJson(v));
      });
    }
    if (json['hotCityList'] != null) {
      hotCityList = new List<City>();
      json['hotCityList'].forEach((v) {
        hotCityList.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCityList != null) {
      data['allCityList'] = this.allCityList.map((v) => v.toJson()).toList();
    }
    if (this.hotCityList != null) {
      data['hotCityList'] = this.hotCityList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityLabel {
  String label;
  List<City> cityList;

  CityLabel({this.label, this.cityList});

  CityLabel.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    if (json['cityList'] != null) {
      cityList = new List<City>();
      json['cityList'].forEach((v) {
        cityList.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.cityList != null) {
      data['cityList'] = this.cityList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



// {
//                      "id": "127",
//                      "city_code": "1604",
//                      "standard_code": "340800",
//                      "script_index": "4",
//                      "agency_code": "\u7696H",
//                      "parent_id": "17",
//                      "name": "\u5b89\u5e86",
//                      "domain": "anqing",
//                      "database": "others",
//                      "pinyin": "anqing",
//                      "location": "b117.056857,30.524895",
//                      "region_id": "7",
//                      "area_code": "0556",
//                      "nc_region_id": "103",
//                      "type": "2"
//                  },
class City {
  String id;
  String cityCode;
  String standardCode;
  String scriptIndex;
  String agencyCode;
  String parentId;
  String name;
  String domain;
  String database;
  String pinyin;
  String location;
  String regionId;
  String areaCode;
  String ncRegionId;
  String type;

 City(
      {this.id,
      this.cityCode,
      this.standardCode,
      this.scriptIndex,
      this.agencyCode,
      this.parentId,
      this.name,
      this.domain,
      this.database,
      this.pinyin,
      this.location,
      this.regionId,
      this.areaCode,
      this.ncRegionId,
      this.type});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityCode = json['city_code'];
    standardCode = json['standard_code'];
    scriptIndex = json['script_index'];
    agencyCode = json['agency_code'];
    parentId = json['parent_id'];
    name = json['name'];
    domain = json['domain'];
    database = json['database'];
    pinyin = json['pinyin'];
    location = json['location'];
    regionId = json['region_id'];
    areaCode = json['area_code'];
    ncRegionId = json['nc_region_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_code'] = this.cityCode;
    data['standard_code'] = this.standardCode;
    data['script_index'] = this.scriptIndex;
    data['agency_code'] = this.agencyCode;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['domain'] = this.domain;
    data['database'] = this.database;
    data['pinyin'] = this.pinyin;
    data['location'] = this.location;
    data['region_id'] = this.regionId;
    data['area_code'] = this.areaCode;
    data['nc_region_id'] = this.ncRegionId;
    data['type'] = this.type;
    return data;
  }
}

