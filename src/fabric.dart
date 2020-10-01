import 'dart:math';

int attack() => Random().nextInt(20) + 1;
int damage(min, max) => Random().nextInt(max - min) + min;

abstract class Weapon {
  final int minDamage = 0;
  final int maxDamage = 0;
  final int critRange = 20;
  final int critMod = 1;
  final int attacksPerRound = 4;
}

abstract class Player {
  int strMod;
  int dexMod;

  int calculate();
}

class Mace {
  final secondaryMinDamage = 3;
  final secondaryMaxDamage = 12;
  final secondaryCritRange = 19;
  final secondaryCritMod = 2;
}

class ShortSword {
  final secondaryMinDamage = 3;
  final secondaryMaxDamage = 6;
  final secondaryCritRange = 18;
  final secondaryCritMod = 2;
}

int Calculate(
    minDamage, maxDamage, strMod, critRange, critMod, attacksPerRound, rounds) {
  int damage = 0;

  strMod = strMod + 12;
  for (; rounds >= 1; rounds--)
    damage += Round(minDamage + strMod, maxDamage + strMod, critRange, critMod,
        attacksPerRound);

  return damage;
}

int Round([minDamage, maxDamage, critRange, critMod, attacksPerRound]) {
  int amountDamage = 0;
  //haste
  attacksPerRound = attacksPerRound + 1;
  for (; attacksPerRound >= 1; attacksPerRound--) {
    int damageRoll = damage(minDamage, maxDamage);
    int attackRoll = attack();

    amountDamage +=
        (attackRoll >= critRange) ? damageRoll * critMod : damageRoll;
  }

  return amountDamage;
}
