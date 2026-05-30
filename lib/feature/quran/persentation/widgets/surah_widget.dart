import 'package:flutter/material.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_entity.dart';
import 'package:my_quran/feature/quran/persentation/page/detail_surah_page.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key, required this.surah});
  final SurahEntity surah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailSurahPage(number: surah.number))),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      const Icon(
                        Icons.star_border_purple500_outlined,
                        size: 45.0,
                      ),
                      Text(
                        surah.number.toString(),
                        style: const TextStyle(fontSize: 8.0),
                      )
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        surah.englishName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(surah.englishNameTranslation)
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Ayah numbers'),
                  Text(
                    surah.numberOfAyahs.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
