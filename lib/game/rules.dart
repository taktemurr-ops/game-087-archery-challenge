import '../core/arcade.dart';
import '../core/level_plan.dart';
import '../core/missions.dart';
import '../core/stats.dart';
import 'shot_engine.dart';

class ArcheryRules extends ArcadeRules<ShotLevel> {
  @override
  String get gameId => 'game-087-archery-challenge';

  @override
  List<String> get optionalMechanics => const [];

  @override
  List<GameStat> get gameStats => const [
        GameStat('tens', 'Onluk isabet', 'Tens', scale: 150),
        GameStat('bullseyes', 'Tam merkez', 'Bullseyes', scale: 50),
        GameStat('arrows', 'Atılan ok', 'Arrows shot', scale: 300),
        GameStat('shots_taken', 'Yapılan atış', 'Shots taken', scale: 300),
      ];

  @override
  List<MissionTemplate> get missionTemplates => const [
        MissionTemplate('tens', 'tens', [37, 75, 150]),
        MissionTemplate('bullseyes', 'bullseyes', [6, 12, 25], coinReward: 80),
      ];

  @override
  ShotLevel generate(LevelSpec spec) => generateShot(ShotKind.archery, spec);

  @override
  ArcadeMeta metaOf(ShotLevel l) => l.meta;

  @override
  ArcadeSim createSim(ShotLevel l) => ShotSim(l);

  @override
  ArcadeInput bot(ArcadeSim sim) => shotBot(sim);
}

ArcadeRules createRules() => ArcheryRules();
