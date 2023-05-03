import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension Context on BuildContext {
  T read<T>(AlwaysAliveRefreshable<T> provider) {
    return ProviderScope.containerOf(this, listen: false).read(provider);
  }

}