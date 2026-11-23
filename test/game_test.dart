import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_yasakli_kelime/oyun_yasakli_kelime.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yasakliKelimeConfig.title.length, 33);
    expect(yasakliKelimeConfig.tagline.length, 33);
    for (final s in yasakliKelimeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(yasakliKelimeConfig.gameId, yasakliKelimeId);
    expect(yasakliKelimeRules.gameId, yasakliKelimeId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yasakliKelimeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yasakliKelimeId, optionalMechanics: yasakliKelimeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(yasakliKelimeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
