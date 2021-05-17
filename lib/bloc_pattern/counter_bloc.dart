import 'dart:async';

import 'package:flutter_bloc_state/bloc_pattern/counter_event.dart';

class CounterBloc {
  int _count = 0;

  final StreamController _counterStateController = StreamController();
  //event sink for count
  StreamSink get _inCounter => _counterStateController.sink;

  //Able to access the _count value using the stream
  Stream get counter => _counterStateController.stream;

  final StreamController _counterEventController =
      StreamController<CounterEvent>();

  // Which takes in the event type to be executed
  Sink<CounterEvent> get counterEventSink =>
      _counterEventController.sink as Sink<CounterEvent>;

  CounterBloc() {
    // connecting the event with the state, whenever there is a new event, update the state
    _counterEventController.stream.listen(
      (_) => _mapEventToState(_ as CounterEvent),
    );
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _count++;
    } else {
      _count--;
    }
    _inCounter.add(_count);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
