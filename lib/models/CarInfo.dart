class CarBasicInfo {
  String id;

  /// 售价
  num price;

  /// 新车价
  num newPrice;

  /// 上牌时间
  String buyDate;

  ///行驶里程
  num travel;

  /// 描述
  String title;
  String pic;

  CarBasicInfo(
      {this.id,
      this.price,
      this.newPrice,
      this.buyDate,
      this.travel,
      this.title,
      this.pic =
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556216087224&di=abec25455f2cf1d21f6be31bcd0bcb5b&imgtype=0&src=http%3A%2F%2Fpic6.58cdn.com.cn%2Fzhuanzh%2Fn_v28fd472f3e539471d821334ceafa78ab1.jpg%3Fw%3D750%26h%3D0"});
  CarBasicInfo.fromJson(Map json) {
    this.id = json["car_id"];
    this.price = num.tryParse(json["price"]);
    this.newPrice = num.tryParse(json["cost_price"]);
    this.buyDate = json["plate_date"];
    this.travel = num.tryParse(json["car_travel"]);
    this.title = json["title"];
    this.pic="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556216087224&di=abec25455f2cf1d21f6be31bcd0bcb5b&imgtype=0&src=http%3A%2F%2Fpic6.58cdn.com.cn%2Fzhuanzh%2Fn_v28fd472f3e539471d821334ceafa78ab1.jpg%3Fw%3D750%26h%3D0";
  }
}

class CarBasicInfoWrapper {
  List<CarBasicInfo> data;
  int code = 0;
  CarBasicInfoWrapper({this.data, this.code});
  CarBasicInfoWrapper.fromJson(List list, int code) {
    if (list.isEmpty || list == null) {
      this.code = 0;
    } else {
      this.code = code;
      data = list.map((item) => CarBasicInfo.fromJson(item)).toList();
    }
  }
}
