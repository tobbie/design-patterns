Design Patterns

1. Abstract_factory design pattern: Provides an interface for creating families of related or dependent objects without specifying their concrete class.

An animal requires an habitat. The organism_factory requires a new _animal which is the Tiger class which inherits from the Animal class. There could many other aniamls  inheriting the animal claass. 
The Habitat class calls simulate_one_day which calls speak and eat of the animals in the habitat.Each aniamal is identified by the orgnigms_factory whiich deteminrmines the Animal named according to the number of animals.
The eat and speak methods refer to the tiger class so jungle.simulate_one_dey ends up returning 

Tiger Animal0 eats meat

Roar

TIger Animal1 eats meat

Roar

2. Singeleton design pettern: Ensure a class only has one Instance and provide a global point of access. 

This Configuration class shows the creation of the same configuaratoin twice in line with the Singleton method. It does not get instantiated

4. Factory method design pattern: Define an interface for creating an object but let subclasses decide which class to instantiate.

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

Yhis is not found in the build action do it raises a NotImplemted error

circle = ShapeFactory.build(:circle, 3)

gives

factory_method.rb:41:in `build': Shape not found (NotImplementedError) from factory_method.rb:50:in `<main>'


The `Not Implemented error is raised from the else of the build method


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

The classses here revolves aroud the UIButton which contain a press_button method. When the button is pressed, the cammand will be executed. The action has be  decoupled from the invoker of the action. AddItemToCartCommand will add aremove items from a cart when unexecuted . The unexecute method in this method is not required for Command's pattern requirements but it is added becuause it is often used with 'execute' method. So we declare Cart and initilaize it.The command is passed into the button, which will later invoke the command.



7. Ccomposite design pattern: Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.

The class Task and CompositeTask are to initialize tasks. you can get the time left for a task by running get_time_required.it trets theindividal and compositionof objrct uniformly as can be seen in add_sub_task(AddDryIngredientsTask.new) and add_sub_task(MakeBatterTask.new).


8. Decorator method design pattern: Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subextending functionality.

THe Coffee class  has a price method that give the price of coffee. The CoffeeWithCream class initialies coffee and calculates it's own price. CoffeeWithSugar decorator accepts a coffee object. The coffee object is the component that is to be 'enclosed' by this decorator. We create a new Coffee object enclose it with a CoffeeWithCream decorator. Next, We can call price and get the combined price of the coffee and coffee cream: $3.00.



9. Facade design pattern: hides the complexities of the system and provides an interface to the client using which the client can access the system. running

This Facade_method is meant to hqve two methods that mix up the methods of SubSystem that have been declared.this can be seen by

facade = FacadeSystem.new

facade.method_1

facade.method_2

10. Flyweight design pattern: hides the complexities of the system and provides an interface to the client using which the client can access the system.

the FlyweightFactory.get_flyweight returns `Flywieght from exiting pool` if the key is alraeady in the pool else it outputs `new Flyweight in pool`the operation method of ConcreteFlyweight class sets things as the  key as the extrinsic state. The input is the intrinsic state.



11. Interpreter design pattern: provides a way to evaluate language grammar or expression. 

this Context class initializes the set value and the Termianl and NonTerminal classes gives the name of the class when interpret is called.

12. Chain of resposibility design pattern: Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it.

The QuestionHandler class acts as the 'Handler' for this implementation of the Chain of Responsibility pattern. If the request does not meet the criteria of the handler in question, then, if there is a successor, the request is passed to the successor. Because we want the 'accept_request' method to be implemented by subclasses of the handler base class, we opt to raise an error if it is not implemented.
 The 'HarryPotterQuestionHandler' is a concrete handler class. It is designed to handle a request should that request fulfill certain criteria.We ask questions and we get answers. We have no idea which class has answered them, and we don't care. That's the beauty of the Chain of Responsibility pattern. The senoc question had no cooresponding handler, and could not be handled. Therefore, we received a failure message.


13. Iterator design pattern: Provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation. 

The Portfolio class implements a method each, which yields successive members of the collection. 
If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.
It calls my_portfolio.each(|aacount| p "#{acount.name}")



14. Mediator design pattern: reduce communication complexity between multiple objects or classes. 

In this example of the Mediator pattern, we have a text field which will receive input from a user. As that input changes, a list of words that the user can select from will be narrowed down to include only those words beginning with the string of text entered by the user. For example, if the user types 'a', then the list of words to choose from will be narrowed down to include only the words in the list beginning with the letter 'a'. At last, we can see the Mediator pattern in action. As the value of the text_field changes to "a", the mediator, which is an observer on the text_field instance, narrows the list down.



15. Memento design pattern: is used to restore state of an object to a previous state. 

 The originator creates and passes a memento to a special class called a caretaker. The sole responsibility of the caretaker is to maintain the memento object of the originator. Then, at a later time, the originator can restore itself to a previous state by setting it’s state to the state encapsulated in the memento object of its caretaker.


16. Obesrver pattern: Define a one-to-many dependency between objects so that when one object changes state, all of its dependents are notified and updated automatically.

The Observer pattern allows you to notify parts of your program that some other part of your program has changed. It does this while allowing you to vary the objects you wish to keep informed ( observers ) from the object being observed ( the subject ) independently. It enables a highly decoupled but well informed system. Critically, you are able to add observers to a subject without having to modify either the observer or the subject. the 'notify_observers' method is where the magic happens. It will notify all of the observer that an update has occured. Each observer presumably shares an Observer interface of some kind. In our case, we're sticking with the most basic and traditional method within the Observer pattern tradition: 'update'. The 'observers' must all adhere to the same interface. Multiple observers of different class types can observe the same subject with ease.
 By the Way, the subject is a publisher and an observer is a subscriber. "Publish/Subscribe" is an alias for "Subject/Observer", which is the Observer pattern through and through. we'll create two observers and our subject. Next, we'll attach the two observers to the subject. Finally, we'll notify the observers that some change has occured.

17. Proxy design pattern: provide a surrugate / placeholder for another object to control access to it.

AccountProtectionProxy cretes an account if the account name is  `bamroc`. `it can deposit some money and withdraw some money, unlike the natural Account Class.

18. Prototype design pattern: Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

PivzzaPrototype is calling pizza_type to select the menu type. The _clone method recreates a clone of the pizza which can then be called the pizza_type(:cheese)to get a listing of the ingredients in it.


19. State design pattern: Allow an object to alter its behaviour when its internal state changes. The object will appear to change its class.

ConcreteStateA class calls handle. it requires

context = Context.new(state)

then

context.request

20. Strategy design pattern: Here, we create objects which represent various strategies and a context object whose behavior varies as per its strategy object. 

In the example attached, an instance of the Car class accepts an engine strategy. There are two engine strategies defined, StraightSixEngine and V8Engine. Each encapsulates a variant of an engine algorithm. Each shares a common interface. 

21. Visitor design pattern: represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.

Order contains an array of product and exposes simple method to add new product to the list. Order contains an array of product and exposes simple method to accept a new product to the list. We can define operations in a separate classes and we can visit the order with that operation. Order will apply that operation to every product from the list. That way we don’t have to expose internal representation of products and we don’t have to extend Order or Product if we wan’t to add new operation.


22. template_method design pattern: Define the skeleton of an algorithm in an operation, deferring some steps to subclasses.

Template Method pattern to the #add_engine step. It is to be defined in derivatives (subclasses) of the CarBuilder class.