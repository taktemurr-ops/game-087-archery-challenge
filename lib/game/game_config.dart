import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'shot_engine.dart';
import 'shot_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-087-archery-challenge',
  title: const ['Okçuluk Meydan Okuması', 'Archery Challenge', 'Bogenschießen', 'Desafío de Tiro con Arco', 'Défi Tir à l\'Arc'],
  tagline: const ['Rüzgârı oku, tam on ikiden vur!', 'Read the wind, hit the bullseye!', 'Wind lesen, ins Schwarze!', '¡Lee el viento, da en el centro!', 'Lisez le vent, en plein centre !'],
  seedColor: const Color(0xFFE63946),
  icon: Icons.gps_fixed,
  rules: ArcheryRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => ShotSim((ctx.generated as GeneratedLevel<ShotLevel>).puzzle),
    paint: paintShot,
    sound: shotSound,
    boosterIcon: Icons.center_focus_strong,
    boosterLabel: (l) => l == 'tr' ? 'Odak' : 'Focus',
    howTo: const ['Basılı tut, nişangahı hedefe getir; nişangah titrer. Parmağını kaldırınca atış yapılır. Uzun beklersen titreme artar.', 'Hold to aim – the sight sways. Lift your finger to shoot. Holding too long makes it shake more.', 'Halten zum Zielen, loslassen zum Schießen.', 'Mantén para apuntar, suelta para disparar.', 'Maintenez pour viser, relâchez pour tirer.'],
  ),
  tutorial: const [
    TutorialStep(Icons.gps_fixed, ['Basılı tut, nişangahı hedefe getir, bırak.', 'Hold, aim, release.', 'Halten, zielen, loslassen.', 'Mantén, apunta, suelta.', 'Maintenez, visez, relâchez.']),
    TutorialStep(Icons.air, ['Rüzgâr oku iter; ters tarafa nişan al.', 'Wind pushes the arrow: aim upwind.', 'Gegen den Wind zielen.', 'Apunta contra el viento.', 'Visez contre le vent.']),
    TutorialStep(Icons.south, ['Ok düşer: biraz yukarı nişan al.', 'Arrows drop: aim a little high.', 'Etwas höher zielen.', 'Apunta un poco alto.', 'Visez un peu haut.']),
  ],
);
