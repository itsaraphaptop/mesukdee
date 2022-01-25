import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _state = prefs.getStringList('ff_state') ?? [];
  }

  SharedPreferences prefs;

  List<String> _state = [];
  List<String> get state => _state;
  set state(List<String> _value) {
    _state = _value;
    prefs.setStringList('ff_state', _value);
  }

  void addToState(String _value) {
    _state.add(_value);
    prefs.setStringList('ff_state', _state);
  }

  void removeFromState(String _value) {
    _state.remove(_value);
    prefs.setStringList('ff_state', _state);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
