extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

getFrontDefaultSpriteUrl() {
  return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon";
}

hasString(String? str) {
  if (str != null) return str;
  return "";
}

int getPokemonNumber(String str) {
  return int.parse(
      str.replaceAll(new RegExp(r'\D+'), "").replaceFirst("2", ""));
}
