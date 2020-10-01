import '../fabric.dart';

class Gleph implements Weapon {
  final String description = "Glepha";
  final minDamage = 3;
  final maxDamage = 24;
  final critRange = 15;
  final critMod = 3;
  final attacksPerRound = 6;
}

class MioGleph extends Gleph with Player {
  MioGleph(this._rounds);

  final _rounds;

  @override
  int calculate() {
    int localRounds = _rounds;
    //+8str + 5 weapon + 6 spec + 6 mace
    int strMod = 8 + 5 + 12;

    int damage = Calculate(minDamage, maxDamage, strMod, critRange, critMod,
        attacksPerRound, localRounds);

    return (damage / _rounds).round();
  }
}
