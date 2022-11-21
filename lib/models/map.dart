class Maps {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  List<Callouts>? callouts;

  Maps({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
    this.callouts,
  });

  Maps.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    if (json['callouts'] != null) {
      callouts = <Callouts>[];
      json['callouts'].forEach((v) {
        callouts!.add(Callouts.fromJson(v));
      });
    }
  }
}

class Callouts {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callouts({this.regionName, this.superRegionName, this.location});

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
}

class Location {
  var x;
  var y;

  Location({this.x, this.y});

  Location.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }
}
