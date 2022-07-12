import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class GitUserInfoEvent {
  GitUserInfoEvent(this.isRet, this.ret);
  bool isRet = false;
  String ret = "";
}
