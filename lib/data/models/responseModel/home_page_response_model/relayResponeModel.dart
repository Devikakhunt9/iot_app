// class RelayResponseModel {
//     Switches switches;
//
//     RelayResponseModel({required this.switches});
//
//     factory RelayResponseModel.fromJson(Map<String, dynamic> json) {
//         return RelayResponseModel(
//             switches:  json['switches']!=null? Switches.fromJson(json['switches']):Switches(dimmers: [], relays: []) ,
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//           data['switches'] = this.switches.toJson();
//               return data;
//     }
// }
//
// class Switches {
//     List<int> dimmers;
//     List<int> relays;
//
//     Switches({required this.dimmers, required this.relays});
//
//     factory Switches.fromJson(Map<String, dynamic> json) {
//         return Switches(
//             dimmers: json['dimmers'] != null ? new List<int>.from(json['dimmers']) : [],
//             relays: json['relays'] != null ? new List<int>.from(json['relays']) : [],
//         );
//     }
//
//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> data = new Map<String, dynamic>();
//           data['dimmers'] = this.dimmers;
//                 data['relays'] = this.relays;
//               return data;
//     }
// }

class RelayResponseModel {
    Switches switches;

    RelayResponseModel({required this.switches});

    factory RelayResponseModel.fromJson(Map<String, dynamic> json) {
        return RelayResponseModel(
            switches: json['switches'] != null
                ? Switches.fromJson(json['switches'])
                : Switches(dimmers: [], relays: []),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'switches': switches.toJson(),
        };
    }
}

class Switches {
    List<int> dimmers;
    List<int> relays;

    Switches({required this.dimmers, required this.relays});

    factory Switches.fromJson(Map<String, dynamic> json) {
        return Switches(
            dimmers: json['dimmers'] != null ? List<int>.from(json['dimmers']) : [],
            relays: json['relays'] != null ? List<int>.from(json['relays']) : [],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'dimmers': dimmers,
            'relays': relays,
        };
    }
}

