import '../fabric.dart';

class WarHammer extends Weapon {
  final String description = "Warhammer";
  final minDamage = 10;
  final maxDamage = 30;
  final critRange = 18;
  final critMod = 2;
  final attacksPerRound = 4;
}

class MioWar extends WarHammer with Player, ShortSword {
  MioWar(this._rounds);

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
