import '../fabric.dart';

class GreatSword extends Weapon {
  final String description = "Great Sword";
  final minDamage = 4;
  final maxDamage = 12;
  final critRange = 18;
  final critMod = 4;
  final attacksPerRound = 4;
}

class MioGreatSword extends GreatSword with Player {
  MioGreatSword(this._rounds);

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
