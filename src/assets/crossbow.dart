import '../fabric.dart';

//import 'package:meta/meta.dart';

class Crossbow implements Weapon {
  final String description = "Crossbow";
  final minDamage = 12;
  final maxDamage = 48;
  final critRange = 20;
  final critMod = 1;
  final attacksPerRound = 4;
}

class MioCross extends Crossbow with Player {
  MioCross(this._rounds);

  final _rounds;

  @override
  int calculate() {
    int localRounds = _rounds;
    //+5str +5 + 6 weapon spec + 6 bane + 8 bolts
    //int strMod = 8 + 12 + 12 + 5; 37
    int strMod = 5 + 5 + 6 + 6 + 15; //37

    int damage = Calculate(minDamage, maxDamage, strMod, critRange, critMod,
        attacksPerRound, localRounds);

    return (damage / _rounds).round();
  }
}
