import 'package:flutter/material.dart';

/// InheritedNotifier based provider that exposes a [Listenable]
/// to the widget tree, that can be accessed via Provider.of on the
/// descendants of were the Notifier is instantiated and exposed. (in our case
/// the root)
class Provider<T extends Listenable> extends InheritedNotifier<T> {
  /// Constructor for the provider that exposes the notifier to the
  /// child.
  const Provider({
    required super.child,
    required super.notifier,
    super.key,
  });

  /// returns the Listenable of the nearest Provider of type T on
  /// the context and registers the caller to be rebuilt when it notifies.
  /// Throws error if no Provider of type T is found.
  static T of<T extends Listenable>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<Provider<T>>();

    if (provider == null) {
      throw Exception("No Provider found in context");
    }

    final notifier = provider.notifier;

    if (notifier == null) {
      throw Exception("No notifier found in Provider");
    }

    return notifier;
  }
}
