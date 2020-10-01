import 'assets/index.dart';
import 'dart:collection';

final int rounds = 50000;
Map result = {};

final List listWeapons = [
  new MioLong(rounds),
  new MioCross(rounds),
  new MioWar(rounds),
  new MioKatana(rounds),
  new MioScimitar(rounds),
  new MioBastard(rounds),
  new MioGreatSword(rounds),
  new MioHalberd(rounds),
  new MioGreatAxe(rounds),
  new MioScyth(rounds),
  new MioThrow(rounds),
  new MioHeavyFlail(rounds),
  new MioRapire(rounds),
  new MioGleph(rounds)
];

main() {
  listWeapons.forEach((e) => {result[e.description] = e.calculate()});

  var sortedKeys = result.keys.toList(growable: false)
    ..sort((k2, k1) => result[k1].compareTo(result[k2]));
  LinkedHashMap sortedResult = new LinkedHashMap.fromIterable(sortedKeys,
      key: (k) => k, value: (k) => result[k]);

  sortedResult.forEach((key, value) {
    print("${key}: ${value}");
  });
}
