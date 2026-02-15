void main() {
  Coffee coffee = new Espresso();
  print('${coffee.getDescription()} \$${coffee.getCost()}');
  
  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} \$${coffee.getCost()}');
  
  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} \$${coffee.getCost()}');
}

interface class Coffee {
  double getCost() {
    throw UnimplementedError();
  }

  String getDescription() {
    throw UnimplementedError();
  }
}

class SimpleCoffee implements Coffee {
  @override
  double getCost() {
    return 5.0;
  }

  @override
  String getDescription() {
    return "Simple Coffee";
  }
}

class Espresso implements Coffee {
  @override
  double getCost() {
    return 10.0;
  }

  @override
  String getDescription() {
    return "Espresso";
  }
}

abstract class CoffeeDecorator implements Coffee {
  late Coffee decoratedCoffee;

  CoffeeDecorator(Coffee coffee) {
    this.decoratedCoffee = coffee;
  }

  @override
  double getCost() {
    return decoratedCoffee.getCost();
  }

  @override
  String getDescription() {
    return decoratedCoffee.getDescription();
  }
}

class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee coffee) : super(coffee);

  @override
  double getCost() {
    return super.getCost() + 2.0;
  }

  @override
  String getDescription() {
    return "${decoratedCoffee.getDescription()}, Milk";
  }
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee coffee) : super(coffee);

  @override
  double getCost() {
    return super.getCost() + 1.0;
  }

  @override
  String getDescription() {
    return "${decoratedCoffee.getDescription()}, Sugar";
  }
}
