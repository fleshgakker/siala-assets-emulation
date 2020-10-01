import '../fabric.dart';

class Katana extends Weapon {
  final String description = "Katana";
  final minDamage = 2;
  final maxDamage = 20;
  final critRange = 12;
  final critMod = 2;
  final attacksPerRound = 4;
}

class MioKatana extends Katana with Player, Mace {
  MioKatana(this._rounds);

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
