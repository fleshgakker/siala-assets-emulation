import '../fabric.dart';

class Scyth extends Weapon {
  final String description = "Scyth";
  final minDamage = 2;
  final maxDamage = 16;
  final critRange = 18;
  final critMod = 5;
  final attacksPerRound = 4;
}

class MioScyth extends Scyth with Player {
  MioScyth(this._rounds);

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
