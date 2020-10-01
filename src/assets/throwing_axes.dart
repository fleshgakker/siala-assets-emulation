import '../fabric.dart';

class ThrowingAxes extends Weapon {
  final String description = "Throwing Axes";
  final minDamage = 5;
  final maxDamage = 20;
  final critRange = 15;
  final critMod = 3;
  final attacksPerRound = 4;
}

class MioThrow extends ThrowingAxes with Player {
  MioThrow(this._rounds);

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
