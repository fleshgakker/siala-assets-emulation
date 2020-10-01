import '../fabric.dart';

class LongBow extends Weapon {
  final String description = "Long Bow";
  final minDamage = 1;
  final maxDamage = 10;
  final critRange = 18;
  final critMod = 3;
  final attacksPerRound = 5;
}

class MioLong extends LongBow with Player {
  MioLong(this._rounds);

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
