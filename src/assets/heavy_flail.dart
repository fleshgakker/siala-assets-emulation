import '../fabric.dart';

class HeavyFlail extends Weapon {
  final String description = "Heavy Flail";
  final minDamage = 8;
  final maxDamage = 24;
  final critRange = 18;
  final critMod = 4;
  final attacksPerRound = 4;
}

class MioHeavyFlail extends HeavyFlail with Player, ShortSword {
  MioHeavyFlail(this._rounds);

  final _rounds;

  @override
  int calculate() {
    int localRounds = _rounds;
    //+8str + 5 weapon + 6 spec + 6 mace
    int strMod = 8 + 5 + 12;

    int damage = Calculate(minDamage, maxDamage, strMod, critRange, critMod,
        attacksPerRound, localRounds);

    int secondaryDamage = Calculate(secondaryMinDamage, secondaryMaxDamage,
        strMod, secondaryCritRange, secondaryCritMod, attacksPerRound, 2);

    return ((damage + secondaryDamage) / _rounds).round();
  }
}
