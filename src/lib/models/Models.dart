// Todo: implementar na Lista Games Models
abstract class Model {
  final int id;

  Model(this.id);

  @override
  bool operator ==(Object other) => other is Model && other.id == id;

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + id.hashCode;
    return result;
  }
}
