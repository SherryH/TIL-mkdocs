- built and battle tested solutions by experienced engineers so we can trust the efficiency
- system design -> used in system design

JS [class Syntax and function Syntax](https://www.digitalocean.com/community/tutorials/understanding-classes-in-javascript#:~:text=A%20JavaScript%20class%20is%20a,syntax%20to%20initialize%20a%20class.&text=With%20prototypes%2C%20any%20function%20can,instance%20using%20the%20new%20keyword.)

### Types of Design Patterns
#### Creational Patterns
- Concerns with how objects / entities are created
- Factory Pattern, Singleton Pattern

#### Structural Patterns
- Class/ composition
- How functionalities can be extended without affecting other parts of system
- OOP, Composition, facade, adaptor, decorator etc

#### Behavioural Patterns
- communication between dissimilar entities
- Observer, Chain of Responsibility...

#### Architectural 
- How software is structured
- MVC, MVVM

## Creational Pattern
### Factory Pattern
- `new` for prototypal relationship, create Factory and create obj
- `this.obj` is the blueprint of the obj that Factory can create
- `createObj` method for creating objects, decide which one to create
- `return new this.obj`  like bulk create the objects using the blueprint 
- https://replit.com/@SherryH/FactoryPattern#index.js

### Singleton Pattern
- only 1 instance is created and used throughout the system
- e.g. Services, databases, configs
- provide public `static` methods for instantiate the object, once
- https://replit.com/@SherryH/SingletonPattern#index.js

### Builder Pattern
- build complex object using simpler obj in step by step process. e.g. DOM
- like a Burger King streamline process. 
- `MealBuilder <- Order` 
- `Meal -> customer`
- `Meal` is the final object, returned to customer. `meal.make(builder)`
- `Meal` contains a `make()` to call builder and call associated steps
- `Meal` returns the completed `Order`  by calling `builder.get()`
- `MealBuilder` contains the _steps_ building the meal, it calls the `Order` action in each step
- `MealBuilder` contains a `get()` for returning the order
- `Order` contains the _actions_ for making the meal. 
- `Order` initialise NOTHING! property values assigned in actions
- `Meal` uses `builder` to return `order`, can call `order` public methods

## Structural Pattern
### Decorator Pattern (composition!)
- many distinct objects with the same underlying code
- Extend optional functionalities, without having to define multiple subclasses
- easy to compose functionalities in subclasses too
- e.g. text formatting: bold Italic, underline

