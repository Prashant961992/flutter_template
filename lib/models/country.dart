class CountryList {
  String name;
  String code;
  bool isSelected;

  CountryList({this.name, this.code,this.isSelected});

  CountryList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['isSelected'] = this.isSelected;
    return data;
  }
}

class CountryModel {
  int id;
  String name;
  String iso3;
  String iso2;
  String phoneCode;
  String capital;
  String currency;
  States states;

  CountryModel(
      {this.id,
      this.name,
      this.iso3,
      this.iso2,
      this.phoneCode,
      this.capital,
      this.currency,
      this.states});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    phoneCode = json['phone_code'];
    capital = json['capital'];
    currency = json['currency'];
    states =
        json['states'] != null ? new States.fromJson(json['states']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iso3'] = this.iso3;
    data['iso2'] = this.iso2;
    data['phone_code'] = this.phoneCode;
    data['capital'] = this.capital;
    data['currency'] = this.currency;
    if (this.states != null) {
      data['states'] = this.states.toJson();
    }
    return data;
  }
}

class States {
  List<String> badakhshan;
  List<String> badghis;
  List<String> baghlan;
  List<String> balkh;
  List<String> bamyan;
  List<String> daykundi;
  List<String> farah;
  List<String> faryab;
  List<String> ghazni;
  List<String> ghR;
  List<String> helmand;
  List<String> herat;
  List<String> jowzjan;
  List<String> kabul;
  List<String> kandahar;
  List<String> kapisa;
  List<String> khost;
  List<String> kunar;
  List<String> kunduzProvince;
  List<String> laghman;
  List<String> logar;
  List<String> nangarhar;
  List<String> nimruz;
  List<String> nuristan;
  List<String> paktia;
  List<String> paktika;
  List<String> panjshir;
  List<String> parwan;
  List<String> samangan;
  List<String> sarEPol;
  List<String> takhar;
  List<String> urozgan;
  List<String> zabul;

  States(
      {this.badakhshan,
      this.badghis,
      this.baghlan,
      this.balkh,
      this.bamyan,
      this.daykundi,
      this.farah,
      this.faryab,
      this.ghazni,
      this.ghR,
      this.helmand,
      this.herat,
      this.jowzjan,
      this.kabul,
      this.kandahar,
      this.kapisa,
      this.khost,
      this.kunar,
      this.kunduzProvince,
      this.laghman,
      this.logar,
      this.nangarhar,
      this.nimruz,
      this.nuristan,
      this.paktia,
      this.paktika,
      this.panjshir,
      this.parwan,
      this.samangan,
      this.sarEPol,
      this.takhar,
      this.urozgan,
      this.zabul});

  States.fromJson(Map<String, dynamic> json) {
    badakhshan = json['Badakhshan'].cast<String>();
    badghis = json['Badghis'].cast<String>();
    baghlan = json['Baghlan'].cast<String>();
    balkh = json['Balkh'].cast<String>();
    bamyan = json['Bamyan'].cast<String>();
    daykundi = json['Daykundi'].cast<String>();
    farah = json['Farah'].cast<String>();
    faryab = json['Faryab'].cast<String>();
    ghazni = json['Ghazni'].cast<String>();
    ghR = json['Ghōr'].cast<String>();
    helmand = json['Helmand'].cast<String>();
    herat = json['Herat'].cast<String>();
    jowzjan = json['Jowzjan'].cast<String>();
    kabul = json['Kabul'].cast<String>();
    kandahar = json['Kandahar'].cast<String>();
    kapisa = json['Kapisa'].cast<String>();
    khost = json['Khost'].cast<String>();
    kunar = json['Kunar'].cast<String>();
    kunduzProvince = json['Kunduz Province'].cast<String>();
    laghman = json['Laghman'].cast<String>();
    logar = json['Logar'].cast<String>();
    nangarhar = json['Nangarhar'].cast<String>();
    nimruz = json['Nimruz'].cast<String>();
    nuristan = json['Nuristan'].cast<String>();
    paktia = json['Paktia'].cast<String>();
    paktika = json['Paktika'].cast<String>();
    panjshir = json['Panjshir'].cast<String>();
    parwan = json['Parwan'].cast<String>();
    samangan = json['Samangan'].cast<String>();
    sarEPol = json['Sar-e Pol'].cast<String>();
    takhar = json['Takhar'].cast<String>();
    urozgan = json['Urozgan'].cast<String>();
    zabul = json['Zabul'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Badakhshan'] = this.badakhshan;
    data['Badghis'] = this.badghis;
    data['Baghlan'] = this.baghlan;
    data['Balkh'] = this.balkh;
    data['Bamyan'] = this.bamyan;
    data['Daykundi'] = this.daykundi;
    data['Farah'] = this.farah;
    data['Faryab'] = this.faryab;
    data['Ghazni'] = this.ghazni;
    data['Ghōr'] = this.ghR;
    data['Helmand'] = this.helmand;
    data['Herat'] = this.herat;
    data['Jowzjan'] = this.jowzjan;
    data['Kabul'] = this.kabul;
    data['Kandahar'] = this.kandahar;
    data['Kapisa'] = this.kapisa;
    data['Khost'] = this.khost;
    data['Kunar'] = this.kunar;
    data['Kunduz Province'] = this.kunduzProvince;
    data['Laghman'] = this.laghman;
    data['Logar'] = this.logar;
    data['Nangarhar'] = this.nangarhar;
    data['Nimruz'] = this.nimruz;
    data['Nuristan'] = this.nuristan;
    data['Paktia'] = this.paktia;
    data['Paktika'] = this.paktika;
    data['Panjshir'] = this.panjshir;
    data['Parwan'] = this.parwan;
    data['Samangan'] = this.samangan;
    data['Sar-e Pol'] = this.sarEPol;
    data['Takhar'] = this.takhar;
    data['Urozgan'] = this.urozgan;
    data['Zabul'] = this.zabul;
    return data;
  }
}
