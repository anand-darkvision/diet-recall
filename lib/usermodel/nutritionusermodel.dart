class Food {
  List<Items>? items;

  Food({this.items});

  Food.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? category;
  String? description;
  int? nutrientDataBankNumber;
  int? dataAlphaCarotene;
  int? dataBetaCarotene;
  int? dataBetaCryptoxanthin;
  double? dataCarbohydrate;
  int? dataCholesterol;
  int? dataCholine;
  int? dataFiber;
  int? dataLuteinAndZeaxanthin;
  int? dataLycopene;
  double? dataNiacin;
  double? dataProtein;
  int? dataRetinol;
  double? dataRiboflavin;
  double? dataSelenium;
  double? dataSugarTotal;
  double? dataThiamin;
  double? dataWater;
  double? dataFatMonosaturatedFat;
  double? dataFatPolysaturatedFat;
  double? dataFatSaturatedFat;
  double? dataFatTotalLipid;
  int? dataMajorMineralsCalcium;
  double? dataMajorMineralsCopper;
  double? dataMajorMineralsIron;
  int? dataMajorMineralsMagnesium;
  int? dataMajorMineralsPhosphorus;
  int? dataMajorMineralsPotassium;
  int? dataMajorMineralsSodium;
  double? dataMajorMineralsZinc;
  int? dataVitaminsVitaminARAE;
  double? dataVitaminsVitaminB12;
  double? dataVitaminsVitaminB6;
  int? dataVitaminsVitaminC;
  double? dataVitaminsVitaminE;
  double? dataVitaminsVitaminK;

  Items(
      {this.category,
        this.description,
        this.nutrientDataBankNumber,
        this.dataAlphaCarotene,
        this.dataBetaCarotene,
        this.dataBetaCryptoxanthin,
        this.dataCarbohydrate,
        this.dataCholesterol,
        this.dataCholine,
        this.dataFiber,
        this.dataLuteinAndZeaxanthin,
        this.dataLycopene,
        this.dataNiacin,
        this.dataProtein,
        this.dataRetinol,
        this.dataRiboflavin,
        this.dataSelenium,
        this.dataSugarTotal,
        this.dataThiamin,
        this.dataWater,
        this.dataFatMonosaturatedFat,
        this.dataFatPolysaturatedFat,
        this.dataFatSaturatedFat,
        this.dataFatTotalLipid,
        this.dataMajorMineralsCalcium,
        this.dataMajorMineralsCopper,
        this.dataMajorMineralsIron,
        this.dataMajorMineralsMagnesium,
        this.dataMajorMineralsPhosphorus,
        this.dataMajorMineralsPotassium,
        this.dataMajorMineralsSodium,
        this.dataMajorMineralsZinc,
        this.dataVitaminsVitaminARAE,
        this.dataVitaminsVitaminB12,
        this.dataVitaminsVitaminB6,
        this.dataVitaminsVitaminC,
        this.dataVitaminsVitaminE,
        this.dataVitaminsVitaminK});

  Items.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    description = json['Description'];
    nutrientDataBankNumber = json['Nutrient Data Bank Number'];
    dataAlphaCarotene = json['Data.Alpha Carotene'];
    dataBetaCarotene = json['Data.Beta Carotene'];
    dataBetaCryptoxanthin = json['Data.Beta Cryptoxanthin'];
    dataCarbohydrate = json['Data.Carbohydrate'];
    dataCholesterol = json['Data.Cholesterol'];
    dataCholine = json['Data.Choline'];
    dataFiber = json['Data.Fiber'];
    dataLuteinAndZeaxanthin = json['Data.Lutein and Zeaxanthin'];
    dataLycopene = json['Data.Lycopene'];
    dataNiacin = json['Data.Niacin'];
    dataProtein = json['Data.Protein'];
    dataRetinol = json['Data.Retinol'];
    dataRiboflavin = json['Data.Riboflavin'];
    dataSelenium = json['Data.Selenium'];
    dataSugarTotal = json['Data.Sugar Total'];
    dataThiamin = json['Data.Thiamin'];
    dataWater = json['Data.Water'];
    dataFatMonosaturatedFat = json['Data.Fat.Monosaturated Fat'];
    dataFatPolysaturatedFat = json['Data.Fat.Polysaturated Fat'];
    dataFatSaturatedFat = json['Data.Fat.Saturated Fat'];
    dataFatTotalLipid = json['Data.Fat.Total Lipid'];
    dataMajorMineralsCalcium = json['Data.Major Minerals.Calcium'];
    dataMajorMineralsCopper = json['Data.Major Minerals.Copper'];
    dataMajorMineralsIron = json['Data.Major Minerals.Iron'];
    dataMajorMineralsMagnesium = json['Data.Major Minerals.Magnesium'];
    dataMajorMineralsPhosphorus = json['Data.Major Minerals.Phosphorus'];
    dataMajorMineralsPotassium = json['Data.Major Minerals.Potassium'];
    dataMajorMineralsSodium = json['Data.Major Minerals.Sodium'];
    dataMajorMineralsZinc = json['Data.Major Minerals.Zinc'];
    dataVitaminsVitaminARAE = json['Data.Vitamins.Vitamin A - RAE'];
    dataVitaminsVitaminB12 = json['Data.Vitamins.Vitamin B12'];
    dataVitaminsVitaminB6 = json['Data.Vitamins.Vitamin B6'];
    dataVitaminsVitaminC = json['Data.Vitamins.Vitamin C'];
    dataVitaminsVitaminE = json['Data.Vitamins.Vitamin E'];
    dataVitaminsVitaminK = json['Data.Vitamins.Vitamin K'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['Description'] = this.description;
    data['Nutrient Data Bank Number'] = this.nutrientDataBankNumber;
    data['Data.Alpha Carotene'] = this.dataAlphaCarotene;
    data['Data.Beta Carotene'] = this.dataBetaCarotene;
    data['Data.Beta Cryptoxanthin'] = this.dataBetaCryptoxanthin;
    data['Data.Carbohydrate'] = this.dataCarbohydrate;
    data['Data.Cholesterol'] = this.dataCholesterol;
    data['Data.Choline'] = this.dataCholine;
    data['Data.Fiber'] = this.dataFiber;
    data['Data.Lutein and Zeaxanthin'] = this.dataLuteinAndZeaxanthin;
    data['Data.Lycopene'] = this.dataLycopene;
    data['Data.Niacin'] = this.dataNiacin;
    data['Data.Protein'] = this.dataProtein;
    data['Data.Retinol'] = this.dataRetinol;
    data['Data.Riboflavin'] = this.dataRiboflavin;
    data['Data.Selenium'] = this.dataSelenium;
    data['Data.Sugar Total'] = this.dataSugarTotal;
    data['Data.Thiamin'] = this.dataThiamin;
    data['Data.Water'] = this.dataWater;
    data['Data.Fat.Monosaturated Fat'] = this.dataFatMonosaturatedFat;
    data['Data.Fat.Polysaturated Fat'] = this.dataFatPolysaturatedFat;
    data['Data.Fat.Saturated Fat'] = this.dataFatSaturatedFat;
    data['Data.Fat.Total Lipid'] = this.dataFatTotalLipid;
    data['Data.Major Minerals.Calcium'] = this.dataMajorMineralsCalcium;
    data['Data.Major Minerals.Copper'] = this.dataMajorMineralsCopper;
    data['Data.Major Minerals.Iron'] = this.dataMajorMineralsIron;
    data['Data.Major Minerals.Magnesium'] = this.dataMajorMineralsMagnesium;
    data['Data.Major Minerals.Phosphorus'] = this.dataMajorMineralsPhosphorus;
    data['Data.Major Minerals.Potassium'] = this.dataMajorMineralsPotassium;
    data['Data.Major Minerals.Sodium'] = this.dataMajorMineralsSodium;
    data['Data.Major Minerals.Zinc'] = this.dataMajorMineralsZinc;
    data['Data.Vitamins.Vitamin A - RAE'] = this.dataVitaminsVitaminARAE;
    data['Data.Vitamins.Vitamin B12'] = this.dataVitaminsVitaminB12;
    data['Data.Vitamins.Vitamin B6'] = this.dataVitaminsVitaminB6;
    data['Data.Vitamins.Vitamin C'] = this.dataVitaminsVitaminC;
    data['Data.Vitamins.Vitamin E'] = this.dataVitaminsVitaminE;
    data['Data.Vitamins.Vitamin K'] = this.dataVitaminsVitaminK;
    return data;
  }
}