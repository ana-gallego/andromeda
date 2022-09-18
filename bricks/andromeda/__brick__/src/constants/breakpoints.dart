import 'package:flutter/material.dart';

/// Layout breakpoints used in the app.
enum Device {
  desktop, //1440
  desktopSmall, // 1024
  ipad, // 768
  mobile; //550
}

Device deviceByWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width >= 1440) return Device.desktop;
  if (width >= 1024) return Device.desktopSmall;
  if (width >= 768) return Device.ipad;
  return Device.mobile;
}

isMobile(BuildContext context) => deviceByWidth(context) == Device.mobile;

isIpad(BuildContext context) => deviceByWidth(context) == Device.ipad;

isDesktop(BuildContext context) => deviceByWidth(context) == Device.desktop;
