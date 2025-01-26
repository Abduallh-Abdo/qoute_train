import 'package:flutter/material.dart';
import 'package:qoute_train/app.dart';

void main() {
  runApp(const QouteApp());
}
 /* [!] This is likely due to a known bug in Android Gradle Plugin (AGP) versions less than 8.2.1,   │
│ when                                                                                             │
│   1. setting a value for SourceCompatibility and                                                 │
│   2. using Java 21 or above.                                                                     │
│ To fix this error, please upgrade your AGP version to at least 8.2.1. The version of AGP that    │
│ your project uses is likely defined in:                                                          │
│ E:\APPS\qoute_train\android\settings.gradle,                                                     │
│ in the 'plugins' closure (by the number following "com.android.application").                    │
│  Alternatively, if your project was created with an older version of the templates, it is likely │
│ in the buildscript.dependencies closure of the top-level build.gradle:                           │
│ E:\APPS\qoute_train\android\build.gradle,                                                        │
│ as the number following "com.android.tools.build:gradle:".
 */