import 'dart:async';
import 'package:src/Pages/GameEspecifico/BotaoFavoritoEvent.dart';

class ContBloc {
  int _contador = 0;
  final _contStateController = StreamController<int>();

  StreamSink<int> get _inputCont => _contStateController.sink;

  Stream<int> get outputCont => _contStateController.stream;

  final _contEventController = StreamController<ContEvent>();

  Sink<ContEvent> get counterEventSink => _contEventController.sink;

  ContBloc() {
    _contEventController.stream.listen(_mapEventToState);
  }
  //map falso
  void _mapEventToState(ContEvent event) {
    if (event is IncrementEvent) {
      _contador++;
    }
    _inputCont.add(_contador);
  }

  void dispose() {
    _contEventController.close();
    _contStateController.close();
  }
}
