import '../fabric.dart';

class Halberd extends Weapon {
  final String description = "Halberd";
  final minDamage = 6;
  final maxDamage = 24;
  final critRange = 18;
  final critMod = 4;
  final attacksPerRound = 4;
}

class MioHalberd extends Halberd with Player {
  MioHalberd(this._rounds);

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
