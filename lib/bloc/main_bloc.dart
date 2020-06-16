import 'dart:async';

import 'package:letsdoit/bloc/bloc_base.dart';


enum MainBlocEvent {
 incrementCounter
 // ...другие события, которые будет обрабатывать Bloc
}

class MainBloc extends BlocBase {
 // данные Bloc-а
 int _counter = 0;

 // stream controllers
 final StreamController<int> _counterController = StreamController<int>();
 final StreamController<MainBlocEvent> _eventController =
     StreamController<MainBlocEvent>();

 Sink<int> get _inCounter => _counterController.sink;
 Stream<int> get outCounter => _counterController.stream;

 Sink<MainBlocEvent> get inEvent => _eventController.sink;
 Stream<MainBlocEvent> get _outEvent => _eventController.stream;

 MainBloc() {
   // подписываемся на поток
   // здесь обрабатываются события, пришедшие со стороны UI
   _outEvent.listen(_handleEvent);
 }

 // альтернатива потоку с UI-событиями
 void onIncrementButton() {
   _handleIncrementCounterEvent();
 }

 @override
 void dispose() {
   // здесь мы закрываем открытые контроллеры
   _eventController.close();
   _counterController.close();
 }

 void _handleEvent(MainBlocEvent event) {
   switch (event) {
     case MainBlocEvent.incrementCounter:
       _handleIncrementCounterEvent();
       break;
     default:
       // чтобы гарантировать, что мы не пропустим ни один кейс enum-а
       assert(false, "Should never reach there");
       break;
   }
 }

 void _handleIncrementCounterEvent() {
   _inCounter.add(++_counter);
 }
}