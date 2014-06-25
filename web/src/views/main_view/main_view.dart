library main_view;

import 'package:polymer/polymer.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

  static const CLASS_NAME = "MainView";

  // non-visual initialization can be done here
  MainView.created() : super.created();

  // life-cycle method called by the Polymer framework when the element is attached to the DOM
  @override void attached() {
    super.attached();
    print("$CLASS_NAME::attached()");
  }
}

