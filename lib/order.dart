class Order{
  final String _date;
  final String _flavor;
  final String _size;
  final double _cost;

  Order(this._date, this._flavor, this._cost, this._size);

  @override
  String toString() {
    return 'Date = $_date, \n Flavor= $_flavor, \n Cost=\$${double.parse((_cost).toStringAsFixed(2))}, \n Size = $_size';
  }

}