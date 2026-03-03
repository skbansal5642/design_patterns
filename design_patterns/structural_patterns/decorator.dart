// CLIENT: Wraps components in multiple layers of decorators,
// works with all objects via the Component interface.
void main() {
  Coffee coffee = new Espresso();
  print('${coffee.getDescription()} \$${coffee.getCost()}');

  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} \$${coffee.getCost()}');

  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} \$${coffee.getCost()}');
  // Decorator -> Decorator -> Component
}

// COMPONENT: Declares the common interface for both wrappers
// and wrapped objects.
interface class Coffee {
  double getCost() {
    throw UnimplementedError();
  }

  String getDescription() {
    throw UnimplementedError();
  }
}

// CONCRETE COMPONENT: Defines the basic behavior which can be
// altered by decorators.
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

// CONCRETE COMPONENT: Defines the basic behavior which can be
// altered by decorators.
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

// BASE DECORATOR: Has a field (decoratedCoffee) for referencing
// a wrapped object. Its type is declared as the Component interface
// so it can contain both concrete components and decorators.
// Delegates all operations to the wrapped object.
abstract class CoffeeDecorator implements Coffee {
  // wrappee: Component
  late Coffee decoratedCoffee;

  // wrappee = c
  CoffeeDecorator(Coffee coffee) {
    this.decoratedCoffee = coffee;
  }

  // Delegates to wrappee.getCost()
  @override
  double getCost() {
    return decoratedCoffee.getCost();
  }

  // Delegates to wrappee.getDescription()
  @override
  String getDescription() {
    return decoratedCoffee.getDescription();
  }
}

// CONCRETE DECORATOR: Defines extra behavior (adding milk) that
// can be added to components dynamically. Overrides methods of
// the base decorator and executes its behavior after calling
// the parent method (super).
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee coffee) : super(coffee);

  @override
  double getCost() {
    return super.getCost() + 2.0; // super::getCost() then extra()
  }

  @override
  String getDescription() {
    return "${decoratedCoffee.getDescription()}, Milk";
  }
}

// CONCRETE DECORATOR: Defines extra behavior (adding sugar) that
// can be added to components dynamically. Overrides methods of
// the base decorator and executes its behavior after calling
// the parent method (super).
class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee coffee) : super(coffee);

  @override
  double getCost() {
    return super.getCost() + 1.0; // super::getCost() then extra()
  }

  @override
  String getDescription() {
    return "${decoratedCoffee.getDescription()}, Sugar";
  }
}
