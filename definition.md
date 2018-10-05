Design Patterns

1. Abstract_factory design pattern: Provides an interface for creating families of related or dependent objects without specifying their concrete class.
An animal requires an habitat. The organism_factory requires a new _animal which is the Tiger class which inherits from the Animal class. There could many other aniamls  inheriting the animal claass. 
The Habitat class calls simulate_one_day which calls speak and eat of the animals in the habitat.Each aniamal is identified by the orgnigms_factory whiich deteminrmines the Animal named according to the number of animals.
the eat and speak methods refer to the tiger class so jungle.simulate_one_dey ends up returning 

Tiger Animal0 eats meat

Roar

TIger Animal1 eats meat

Roar

2. Singeleton design pettern: Ensure a class only has one Instance and provide a global point of access. 

This Configuration class shows the creation of the same configuaratoin twice in line with the Singleton method. It does not get instantiated

4. Factory method design pattern: Define an interface for createing an object but let subclasses decide which class to instantiate.

This is to draw a shape uing the ShapeFactory.build method

triangle = ShapeFactory.build(:triangle, 2, 3, 4)

triangle.draw

square = ShapeFactory.build(:square, 4)

square.draw

gives 

[2, 3, 4]

drawing triangle

[4]
drawing square

this is not found in the build action do it raises a NotImplemted error

circle = ShapeFactory.build(:circle, 3)

gives

factory_method.rb:41:in `build': Shape not found (NotImplementedError) from factory_method.rb:50:in `<main>'


the `Not Implemented error is raised from the else of the build method


5. Bridge design pattern: Decouple an abstraction from its implementation so that the two can vary independently.

The classes here are to build  a shape and determine what to draw it is to be drawn upon. this can be done by 

Rectangle.new(MacOs.new)


So the rectangle.draw shows up 'drawing a rectangle upon a Mac'

6. Command design pattern: Encapsulate a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations.
this is meant to add a book to the cart & invoke the UIButtonn press button. this is done by 
item = Item.new("Book")

cart = Cart.get_current_cart

command = AddItemToCartCommand.new(item, cart)

button = UIButton.new(command)

then

button.press_button

The classses here revolves aroud the UIButton which contain a press_button method. when the button is pressed, the cammand will be executed. th action has be  decoupled from th e invoker of the action. AddItemToCartCommand will add aremove items from a cart when unexecuted . The unexecute method in this method is not require for Command's pattern requirements but it is added becuause it id often used with 'execute' method. So we declare Cart and initilaize it and Cart. th command is passed into the button, which will later invoke the command.



7. Ccomposite design pattern: Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.

The class Task and CompositeTask are to initialize tasks. you can get the time left for a task by running get_time_required 


8. Decorator method design pattern: Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subextending functionality.

THe Coffee class  has a price method that give the price of coffee. The CoffeeWithCream class initialies coffee and calculates it's own price. CoffeeWithSugar decorator accepts a coffee object. The coffee object is the component that is to be 'enclosed' by this decorator. We create a new Coffee object enclose it with a CoffeeWithCream decorator. Next, We can call price and get the combined price of the coffee and coffee cream: $3.00.



9. Facade design pattern: hides the complexities of the system and provides an interface to the client using which the client can access the system. running

This Facade_method is meant to hqve two methods that mix up the methods of SubSystem that have been declared.this can be seen by

facade = FacadeSystem.new

facade.method_1

facade.method_2

10. Flyweight design pattern: hides the complexities of the system and provides an interface to the client using which the client can access the system.

the FlyweightFactory.get_flyweight returns `Flywieght from exiting pool` if the key is alraeady in the pool else it outputs `new Flyweight in pool`the operation method of ConcreteFlyweight class sets things as the  key as the extrinsic state. `the input is the intrinsic state



11. Interpreter design pattern: provides a way to evaluate language grammar or expression. 

this Context class initializes the set value and the Termianl and NonTerminal classes gives the name of the class when interpret is called.

12. Chain of resposibility design pattern: Avoid coupling the sender of a request to its receiver by giving more thanone object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.

The QuestionHandler class acts as the 'Handler' for this implementation of the Chain of Responsibility pattern. If the request does not meet the criteria of the handler in question, then, if there is a successor, the request is passed to the successor.because we want the 'accept_request' method to be implemented by subclasses of the handler base class, we opt to raise an error if it is not implemented.
By the way, the 'accept_request' method, as used in the 'process_request' method, is actually an example of the Template Method pattern. The 'HarryPotterQuestionHandler' is a concrete handler class. It is designed to handle a request should that request fulfill certain criteria.We ask questions and we get answers. We have no idea which class has answered them, and we don't care. That's the beauty of the Chain of Responsibility pattern. The mifddle question had no cooresponding handler, and could not be handled. Therefore, we received a failure message.


13. Iterator design pattern: Provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation. 

The Portfolio class implements a method each, which yields successive members of the collection. 
If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.
It calls my_portfolio.each(|aacount| p "#{acount.name}")



14. Mediator design pattern: reduce communication complexity between multiple objects or classes. This pattern provides a mediator class which normally handles all the communications between different classes and supports easy maintenance of the code by loose coupling.

With the Mediator pattern, this can be accomplished by creating a mediator object which handles the communication between a group of objects while leaving those objects completely decoupled from one another, and completely unaware of the mediator object itself. Here, we are creating
a new List instance, passing it in a list of fruits. We are also creating a text_field instance and a mediator instance, which takes both the list instance and the text_field instance as parameters. Now, at last, we can see the Mediator pattern in action. As the value of the text_field changes to "a", the mediator, which is an observer on the text_field instance, narrows the list down. As the user continues to type, the mediator continues to narrow the list of words. Neither the list, nor the text_field 'colleagues' are aware of one another. And, neither the list, nor the text_field are aware of the mediator. The 'save_to_memento' method will create (originate) a new memento object, passing it a value that is representative of the current state of this originator object.we restore the state of the originator to the state that has been captured within the memento object of the caretaker object. The originator's state will be restored from "name:bar" back to the previous state of "name:foo"



15. Memento design pattern: is used to restore state of an object to a previous state. 

The originator creates and passes a memento to a special class called a caretaker. The sole responsibility of the caretaker is to maintain the memento object of the originator. Then, at a later time, the originator can restore itself to a previous state by setting it’s state to the state encapsulated in the memento object of its caretaker. The 'Originator' of the Memento pattern is an object that is responsible for saving its state by creating a memento and then passing a representation of its state into that memento, to be restored at a later time.
Here, we are creating
a new List instance, passing it in a list of fruits. We are also creating a text_field instance and a mediator instance, which takes both the list instance and the text_field instance as parameters. Now, at last, we can see the Mediator pattern in action. As the value of the text_field changes to "a", the mediator, which is an observer on the text_field instance, narrows the list down. As the user continues to type, the mediator continues to narrow the list of words. Neither the list, nor the text_field 'colleagues' are aware of one another. And, neither the list, nor the text_field are aware of the mediator. The 'save_to_memento' method will create (originate) a new memento object, passing it a value that is representative of the current state of this originator object.we restore the state of the originator to the state that has been captured within the memento object of the caretaker object. The originator's state will be restored from "name:bar" back to the previous state of "name:foo"


16. Obesrver pattern: Define a one-to-many dependency between objects so that when one object changes state, all of its dependents are notified and updated automatically.

The Observer pattern allows you to notify parts of your program that some other part of your program has changed. It does this while allowing you to vary the objects you wish to keep informed ( observers ) from the object being observed ( the subject ) independently. It enables a highly decoupled but well informed system. Critically, you are able to add observers to a subject without having to modify either the observer or the subject. the 'notify_observers' method is where the magic happens. It will notify all of the observer that an update has occured. Each observer presumably shares an Observer interface of some kind. In our case, we're sticking with the most basic and traditional method within the Observer pattern tradition: 'update'. The 'observers' must all adhere to the same interface. Multiple observer of different class types can observe the same subject with ease.
What you choose to do with the information that has been broadcast to an observer is up to you. By the Way, the subject is a publisher and an observer is a subscriber. "Publish/Subscribe" is an alias for "Subject/Observer", which is the Observer pattern through and through. we'll create two observers and our subject. Next, we'll attach the two observers to the subject. Finally, we'll notify the observers that some change has occured.

17. Proxy design pattern: provide a surrugate / placeholder for another object to control access to it.

AccountProtectionProxy cretes an account if the account name is  `bamroc`. `it can deposit some money and withdraw some money.

18. Prototype design pattern: Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

PivzzaPrototype is calling pizza_type to select the menu type. the _clone method recreates a clone of the pizza.


19. State design pattern: Allow an object to alter its behaviour when its internal state changes. The object will appear to change its class.

ConcreteStateA class calls handleit requires

context = Context.new(state)

then

context.request

20. Strategy design pattern: Here, we create objects which represent various strategies and a context object whose behavior varies as per its strategy object. 

In the example attached, an instance of the Car class accepts an engine strategy. There are two engine strategies defined, StraightSixEngine and V8Engine. Each encapsulates a variant of an engine algorithm. Each shares a common interface. Be sure to couple clients to the interface shared by each of the strategies, and not to any concrete strategy

21. Visitor design pattern: represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.

Order contains an array of product and exposes simple method to add new product to the list.Order contains an array of product and exposes simple method to aaccept a new product to the list. We can define operations in a separate classes and we can visit the order with that operation. Order will apply that operation to every product from the list. That way we don’t have to expose internal representation of products and we don’t have to extend Order or Product if we wan’t to add new operation.


22. template_method design pattern: Define the skeleton of an algorithm in an operation, deferring some steps to subclasses.Its subclasses can override the method implementation as per need but the invocation is to be in the same way as defined by an abstract class. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm’s structure.

The #build_car method of the CarBuilder class defines an algorithm containing a step which is expected to vary, the #add_engine method. Therefore, we’ve elected to apply the Template Method pattern to the #add_engine step. It is to be defined in derivatives (subclasses) of the CarBuilder class.
Derivative (Subclass) of CarBuilder.Determines which engine will be used for the build_car algotithm.

