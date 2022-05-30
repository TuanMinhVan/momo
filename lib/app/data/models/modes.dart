import '../../core/styles/style.dart';
import '../../widgets/reaction_button/reaction_button.dart';

final Map<String, Color> _reactColors = {
  "like": Colors.blueAccent,
  "love": Colors.red,
  "haha": Colors.yellow,
  "wow": Colors.amber,
  "sad": Colors.amberAccent,
  "angry": Colors.deepOrange
};

List<Reaction<String>> reactions = _reactColors.entries
    .map(
      (e) => Reaction(
        previewIcon: Image.asset(
          'assets/reactions/${e.key}.gif',
          width: 50,
        ),
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Image.asset('assets/reactions/${e.key}.png', height: 14),
              const SizedBox(width: 5),
              Text(
                e.key.toTitleCase(),
                style: TextStyle(color: e.value, fontSize: 11),
              )
            ],
          ),
        ),
        title: DecoratedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Text(
              e.key.toTitleCase(),
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: e.key,
      ),
    )
    .toList();

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
