/**
 * This is an example of how to set up the [EventBus] and its events.
 */
import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

/// Event 修改主题色
class ThemeColorEvent {
  String colorStr;

  ThemeColorEvent(this.colorStr);
}