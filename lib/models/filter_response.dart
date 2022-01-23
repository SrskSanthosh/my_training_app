class FilterModelResponse {
  List<FilterList>? filterList;

  FilterModelResponse({this.filterList});

  FilterModelResponse.fromJson(Map<String, dynamic> json) {
    if (json['filterList'] != null) {
      filterList = <FilterList>[];
      json['filterList'].forEach((v) {
        filterList!.add(FilterList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filterList != null) {
      data['filterList'] = filterList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilterList {
  String? id;
  String? sortName;
  bool? isSelected;
  List<FilterSubList>? filterSubList;

  FilterList({this.id, this.sortName, this.isSelected, this.filterSubList});

  FilterList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortName = json['sortName'];
    isSelected = json['isSelected'];
    if (json['filterSubList'] != null) {
      filterSubList = <FilterSubList>[];
      json['filterSubList'].forEach((v) {
        filterSubList!.add(FilterSubList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sortName'] = sortName;
    data['isSelected'] = isSelected;
    if (filterSubList != null) {
      data['filterSubList'] = filterSubList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilterSubList {
  String? id;
  String? filterName;
  bool? isSelected;

  FilterSubList({this.id, this.filterName, this.isSelected});

  FilterSubList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filterName = json['filterName'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filterName'] = filterName;
    data['isSelected'] = isSelected;
    return data;
  }
}
