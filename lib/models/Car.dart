import 'package:guazi_app/models/Paging.dart';

class PageCar {
  int code;
  List<CarItem> item;
  Pagination pagination;
  PageCar({this.code=0,this.item,this.pagination});
  PageCar.fromJson(Map json){
    List<CarItem> items=[];
    code=json["code"]??-1;
    pagination=new Pagination(pageSize: json["size"]??10,currentPage: json["current"]??1,total: json["total"]);
    if(json["data"] != null){
      json['data'].map((item)=>{items.add(CarItem.fromJson(item))}).toList();
    }
    this.item=items;
  }

}

class CarItem {
  String title;
  String link;
  String albumnail;
  String year;
  String mete;
  String service;
  String price;
  String guidePrice;
  String yanxuan;
  String chaozhi;
  String zhunxin;
  String id;
  String city;
  String chexing;
  String cardDate;
  List<String> images;
  String brandNo;
  String company;
  String level;
  String engine;
  String gearbox;
  String struct;
  String size;
  String wheelBase;
  String cargoVolume;
  String weight;
  String displacement;
  String intakeForm;
  String cylinder;
  String maxOutput;
  String maxTorque;
  String fuelType;
  String fuelGrade;
  String oilSupply;
  String emissionStd;
  String driveType;
  String assistType;
  String iFS;
  String iRS;
  String frontBrake;
  String rearBrake;
  String parkingBraking;
  String frontTyre;
  String rearTire;
  String mainCopilotAirbag;
  String anterioPosteriorAirbag;
  String frontBackHeadAirbag;
  String tirePressureMonitor;
  String centralLock;
  String childSeatInterface;
  String keylessStartup;
  String aBS;
  String eSP;
  String electricSkylight;
  String panoramicSunroof;
  String electricSuctionDoor;
  String inductionTrunk;
  String inductionWiper;
  String rearWiper;
  String electricWindow;
  String electricRearviewMirror;
  String rearviewMirrorHeating;
  String multiSteerWheel;
  String cruiseControl;
  String airConditioner;
  String autoAirConditioning;
  String gPS;
  String pDC;
  String rearViewCamera;
  String leatherSeat;
  String seatHeating;
  String cardPlace;

  CarItem(
      {this.title,
      this.link,
      this.albumnail,
      this.year,
      this.mete,
      this.service,
      this.price,
      this.guidePrice,
      this.yanxuan,
      this.chaozhi,
      this.zhunxin,
      this.id,
      this.city,
      this.chexing,
      this.cardDate,
      this.images,
      this.brandNo,
      this.company,
      this.level,
      this.engine,
      this.gearbox,
      this.struct,
      this.size,
      this.wheelBase,
      this.cargoVolume,
      this.weight,
      this.displacement,
      this.intakeForm,
      this.cylinder,
      this.maxOutput,
      this.maxTorque,
      this.fuelType,
      this.fuelGrade,
      this.oilSupply,
      this.emissionStd,
      this.driveType,
      this.assistType,
      this.iFS,
      this.iRS,
      this.frontBrake,
      this.rearBrake,
      this.parkingBraking,
      this.frontTyre,
      this.rearTire,
      this.mainCopilotAirbag,
      this.anterioPosteriorAirbag,
      this.frontBackHeadAirbag,
      this.tirePressureMonitor,
      this.centralLock,
      this.childSeatInterface,
      this.keylessStartup,
      this.aBS,
      this.eSP,
      this.electricSkylight,
      this.panoramicSunroof,
      this.electricSuctionDoor,
      this.inductionTrunk,
      this.inductionWiper,
      this.rearWiper,
      this.electricWindow,
      this.electricRearviewMirror,
      this.rearviewMirrorHeating,
      this.multiSteerWheel,
      this.cruiseControl,
      this.airConditioner,
      this.autoAirConditioning,
      this.gPS,
      this.pDC,
      this.rearViewCamera,
      this.leatherSeat,
      this.seatHeating,
      this.cardPlace});

  CarItem.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    title = json['title'];
    link = json['link'];
    albumnail = json['albumnail'];
    year = json['year'];
    mete = json['mete'];
    service = json['service'];
    price = json['price'];
    guidePrice = json['guide_price'];
    yanxuan = json['yanxuan'];
    chaozhi = json['chaozhi'];
    zhunxin = json['zhunxin'];
    id = json['id'];
    city = json['city'];
    chexing = json['chexing'];
    cardDate = json['card_date'];

    List<String> imgList = json['images'].split(",");
    var rStr = "src=[\'\"]?([^\'\"]*)[\'\"]?";
    var reg = RegExp(rStr);
    for (int i = 0; i < imgList.length; i++) {
      Iterable<Match> matches = reg.allMatches(imgList[i]);
      for (Match m in matches) {
        if (m.group(1).isNotEmpty) {
          images.add(m.group(1));
        }
      }
    }
    this.images = images;
    brandNo = json['brand_no'];
    company = json['company'];
    level = json['level'];
    engine = json['engine'];
    gearbox = json['gearbox'];
    struct = json['struct'];
    size = json['size'];
    wheelBase = json['wheel_base'];
    cargoVolume = json['cargo_volume'];
    weight = json['weight'];
    displacement = json['displacement'];
    intakeForm = json['Intake_form'];
    cylinder = json['cylinder'];
    maxOutput = json['max_output'];
    maxTorque = json['max_torque'];
    fuelType = json['fuel_type'];
    fuelGrade = json['fuel_grade'];
    oilSupply = json['oil_supply'];
    emissionStd = json['emission_std'];
    driveType = json['drive_type'];
    assistType = json['assist_type'];
    iFS = json['IFS'];
    iRS = json['IRS'];
    frontBrake = json['front_brake'];
    rearBrake = json['rear_brake'];
    parkingBraking = json['parking_braking'];
    frontTyre = json['front_tyre'];
    rearTire = json['rear_tire'];
    mainCopilotAirbag = json['main_copilot_airbag'];
    anterioPosteriorAirbag = json['anterio_posterior_airbag'];
    frontBackHeadAirbag = json['front_back_head_airbag'];
    tirePressureMonitor = json['tire_pressure_monitor'];
    centralLock = json['central_lock'];
    childSeatInterface = json['child_seat _interface'];
    keylessStartup = json['keyless_startup'];
    aBS = json['ABS'];
    eSP = json['ESP'];
    electricSkylight = json['electric_skylight'];
    panoramicSunroof = json['panoramic_sunroof'];
    electricSuctionDoor = json['electric_suction_door'];
    inductionTrunk = json['Induction_trunk'];
    inductionWiper = json['Induction_wiper'];
    rearWiper = json['rear_wiper'];
    electricWindow = json['electric_window'];
    electricRearviewMirror = json['electric_rearview_mirror'];
    rearviewMirrorHeating = json['rearview_mirror_heating'];
    multiSteerWheel = json['multi_steer_wheel'];
    cruiseControl = json['cruise_control'];
    airConditioner = json['air_conditioner'];
    autoAirConditioning = json['auto_air_conditioning'];
    gPS = json['GPS'];
    pDC = json['PDC'];
    rearViewCamera = json['rear_view_camera'];
    leatherSeat = json['leather_seat'];
    seatHeating = json['seat_heating'];
    cardPlace = json['card_place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['albumnail'] = this.albumnail;
    data['year'] = this.year;
    data['mete'] = this.mete;
    data['service'] = this.service;
    data['price'] = this.price;
    data['guide_price'] = this.guidePrice;
    data['yanxuan'] = this.yanxuan;
    data['chaozhi'] = this.chaozhi;
    data['zhunxin'] = this.zhunxin;
    data['id'] = this.id;
    data['city'] = this.city;
    data['chexing'] = this.chexing;
    data['card_date'] = this.cardDate;

    data['images'] = this.images.join(",");
    data['brand_no'] = this.brandNo;
    data['company'] = this.company;
    data['level'] = this.level;
    data['engine'] = this.engine;
    data['gearbox'] = this.gearbox;
    data['struct'] = this.struct;
    data['size'] = this.size;
    data['wheel_base'] = this.wheelBase;
    data['cargo_volume'] = this.cargoVolume;
    data['weight'] = this.weight;
    data['displacement'] = this.displacement;
    data['Intake_form'] = this.intakeForm;
    data['cylinder'] = this.cylinder;
    data['max_output'] = this.maxOutput;
    data['max_torque'] = this.maxTorque;
    data['fuel_type'] = this.fuelType;
    data['fuel_grade'] = this.fuelGrade;
    data['oil_supply'] = this.oilSupply;
    data['emission_std'] = this.emissionStd;
    data['drive_type'] = this.driveType;
    data['assist_type'] = this.assistType;
    data['IFS'] = this.iFS;
    data['IRS'] = this.iRS;
    data['front_brake'] = this.frontBrake;
    data['rear_brake'] = this.rearBrake;
    data['parking_braking'] = this.parkingBraking;
    data['front_tyre'] = this.frontTyre;
    data['rear_tire'] = this.rearTire;
    data['main_copilot_airbag'] = this.mainCopilotAirbag;
    data['anterio_posterior_airbag'] = this.anterioPosteriorAirbag;
    data['front_back_head_airbag'] = this.frontBackHeadAirbag;
    data['tire_pressure_monitor'] = this.tirePressureMonitor;
    data['central_lock'] = this.centralLock;
    data['child_seat _interface'] = this.childSeatInterface;
    data['keyless_startup'] = this.keylessStartup;
    data['ABS'] = this.aBS;
    data['ESP'] = this.eSP;
    data['electric_skylight'] = this.electricSkylight;
    data['panoramic_sunroof'] = this.panoramicSunroof;
    data['electric_suction_door'] = this.electricSuctionDoor;
    data['Induction_trunk'] = this.inductionTrunk;
    data['Induction_wiper'] = this.inductionWiper;
    data['rear_wiper'] = this.rearWiper;
    data['electric_window'] = this.electricWindow;
    data['electric_rearview_mirror'] = this.electricRearviewMirror;
    data['rearview_mirror_heating'] = this.rearviewMirrorHeating;
    data['multi_steer_wheel'] = this.multiSteerWheel;
    data['cruise_control'] = this.cruiseControl;
    data['air_conditioner'] = this.airConditioner;
    data['auto_air_conditioning'] = this.autoAirConditioning;
    data['GPS'] = this.gPS;
    data['PDC'] = this.pDC;
    data['rear_view_camera'] = this.rearViewCamera;
    data['leather_seat'] = this.leatherSeat;
    data['seat_heating'] = this.seatHeating;
    data['card_place'] = this.cardPlace;
    return data;
  }
}
