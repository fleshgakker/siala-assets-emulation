import '../fabric.dart';

class Bastard extends Weapon {
  final String description = "Bastard Sword";
  final minDamage = 3;
  final maxDamage = 24;
  final critRange = 15;
  final critMod = 2;
  final attacksPerRound = 4;
}

class MioBastard extends Bastard with Player, Mace {
  MioBastard(this._rounds);

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
