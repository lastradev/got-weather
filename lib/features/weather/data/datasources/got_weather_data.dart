import '../../../../core/theme/app_themes.dart';

import '../../domain/entities/got_weather.dart';

enum GOTCity {
  beyondTheWall,
  winterfell,
  highgarden,
  kingsLanding,
  dorne,
  yunkai,
  dragonstone,
  dothrakiSea,
  redMountains,
  volantis,
  kingsroad,
  qarth,
  pyke,
  meereen,
  ironIslands,
  braavos,
}

const gotWeatherData = {
  GOTCity.beyondTheWall: GOTWeather(
    appTheme: AppTheme.beyondTheWall,
    title: 'Feels Like\nBeyond\nthe wall',
    subtitle: 'Looks like an arrowhead...',
    background: 'beyondTheWallBg',
    minTemp: -100,
    maxTemp: 5,
  ),
  GOTCity.winterfell: GOTWeather(
    appTheme: AppTheme.winterfell,
    title: 'Feels Like\nWinterfell',
    subtitle: 'Winter is coming...',
    background: 'winterfellBg',
    minTemp: 6,
    maxTemp: 13,
  ),
  GOTCity.highgarden: GOTWeather(
    appTheme: AppTheme.highgarden,
    title: 'Feels Like\nHighgarden',
    subtitle: 'I want her to know, it was me...',
    background: 'highgardenBg',
    minTemp: 14,
    maxTemp: 15,
  ),
  GOTCity.dragonstone: GOTWeather(
    appTheme: AppTheme.dragonstone,
    title: 'Feels Like\nDragonstone',
    subtitle: 'Shall we begin?',
    background: 'dragonstoneBg',
    minTemp: 16,
    maxTemp: 17,
  ),
  GOTCity.ironIslands: GOTWeather(
    appTheme: AppTheme.ironIslands,
    title: 'Feels Like\nIron Islands',
    subtitle: 'What is dead may never die...',
    background: 'ironIslandsBg',
    minTemp: 18,
    maxTemp: 19,
  ),
  GOTCity.pyke: GOTWeather(
    appTheme: AppTheme.pyke,
    title: 'Feels Like\nPyke',
    subtitle: 'Bridges knotted Pyke together...',
    background: 'pykeBg',
    minTemp: 20,
    maxTemp: 21,
  ),
  GOTCity.volantis: GOTWeather(
    appTheme: AppTheme.volantis,
    title: 'Feels Like\nVolantis',
    subtitle: 'The city thirsts for war...',
    background: 'volantisBg',
    minTemp: 22,
    maxTemp: 23,
  ),
  GOTCity.meereen: GOTWeather(
    appTheme: AppTheme.meereen,
    title: 'Feels Like\nMeereen',
    subtitle: 'A free city of free men',
    background: 'meereenBg',
    minTemp: 24,
    maxTemp: 25,
  ),
  GOTCity.kingsLanding: GOTWeather(
    appTheme: AppTheme.kingsLanding,
    title: "Feels Like\nKing's\nLanding",
    subtitle: 'Power is power...',
    background: 'kingsLandingBg',
    minTemp: 26,
    maxTemp: 27,
  ),
  GOTCity.kingsroad: GOTWeather(
    appTheme: AppTheme.kingsroad,
    title: 'Feels Like\nKingsroad',
    subtitle: 'The kingsroad can be perilous...',
    background: 'kingsRoadBg',
    minTemp: 28,
    maxTemp: 29,
  ),
  GOTCity.braavos: GOTWeather(
    appTheme: AppTheme.braavos,
    title: 'Feels Like\nBraavos',
    subtitle: 'Valar Morghulis',
    background: 'braavosBg',
    minTemp: 30,
    maxTemp: 31,
  ),
  GOTCity.dorne: GOTWeather(
    appTheme: AppTheme.dorne,
    title: 'Feels Like\nSunspear',
    subtitle: 'You might catch a snake...',
    background: 'dorneBg',
    minTemp: 32,
    maxTemp: 33,
  ),
  GOTCity.redMountains: GOTWeather(
    appTheme: AppTheme.redMountains,
    title: 'Feels Like\nRed\nMountains',
    subtitle: 'Promise me, Ned...',
    background: 'redMountainsBg',
    minTemp: 34,
    maxTemp: 35,
  ),
  GOTCity.qarth: GOTWeather(
    appTheme: AppTheme.qarth,
    title: 'Feels Like\nQarth',
    subtitle: 'Qarth is a city of merchants...',
    background: 'qarthBg',
    minTemp: 36,
    maxTemp: 37,
  ),
  GOTCity.yunkai: GOTWeather(
    appTheme: AppTheme.yunkai,
    title: 'Feels\nLike\nYunkai',
    subtitle: 'We shall enslave once more...',
    background: 'yunkaiBg',
    minTemp: 38,
    maxTemp: 39,
  ),
  GOTCity.dothrakiSea: GOTWeather(
    appTheme: AppTheme.dothrakiSea,
    title: 'Feels Like\nDothraki Sea',
    subtitle: 'My sun and stars...',
    background: 'dothrakiSeaBg',
    minTemp: 40,
    maxTemp: 100,
  ),
};
