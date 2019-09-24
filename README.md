#  Calc Coding Challenge

## Summary
A calculator implementation in Swift as requested by Vahe Karamian.


## Folder Structure
/Calc: The root folder
|
|--- Calc.xcodeproj: The project file to open in XCode
|
|--- README.md: This file
|
|--- /Calc: Primary source code folder
|
|--- /CalcTests: Unit tests are here but none are defined
|
|--- /CalcUITests: UI tests are here but none are defined
|
L-- /Screenshots: Screenshots from the code runnin on an iPhone X and an iPad Pro (13")

## Compiling The Code
This code was developed originally on Xcode 10 but then was quickly re-developed 
on the release version of XCode 11 and tested on an iPhone X as well as an iPad Pro (13 inch).
In order to compile and run the code you will need XCode 11 but it will run on any iPhone or iPad device
that runs iOS 12 or later.

## Interface Summary (Main.storyboard)
The .xcodeproj file has been set to use Main.storyboard as the primary interface. 
A LaunchScreen.storyboard is provided but set to a default blank screen.
A default blank icon is also set. I would normally offload the development of these assets to a professional Graphics artist.

It is normal for me as a developer to take a layout which is defined by a Graphic artist and then model that layout using the
storyboard. I will take into account any transitions or styling queues defined by a UX or UI designer assuming they make
sense for the device. **_When needed, if the UX or UI designer does not have a mockup that fits into the general Apple Human
Interface Guidelines for the device I will make recommendations and changes as needed so as to maintain the general wishes
of the product team. However, I will not break the Apple HIG as doing so will be a risk to the app not being approved by Apple
for distribution. If there is part of the app that needs to be shown the 'Apple Way' it will be so as even though it may be your app,
the OS and the primary experience it runs on belongs to Apple._**

For the most part inside Main.storyboard are two scenes depicting the layouts of two view controllers.

The primary view controller defines the layout of a standard calculator using horizontal and vertical stacks.
There is a minimum use of using constraints (just relegated to the 3 buttons in the lower-right corner of the primary view controller).
I make use of settring colors and other normally programmable styling settings such as corner radius within the
User Defined Runtime Attributes panel of the storyboard left-inspector although I will also modify these directly in code if the
UX needs it (example: when setting the fonts in the tape view).

The list view is the only other view controller but it has a minimum layout: just a default list containing text cells. It is displayed modally and
will contain a list of the operations that were performed on the calculator.

## Source Summary
In the interest of time I have kept the application in an MVC paradigm although I am more than capable of developing the app using
VIPER (my preference and the paradigm I use on my personal projects) or MVVM (I do not recommend this paradigm).

ViewController.swift contains the primary logic for this code challenge and the primary function that performs the logic is buttonPressed(sender:)
The function is linked to almost all buttons in the Main.storyboard and it basically examines the title of the button sending the action
and compares it in a switch statement... functions such as addition, multiplication, etc. are interpreted while numbers are taken into account
as input.

A feature of the Swift and Objective-C languages that I have relied on for more than a decade is implemented in ViewController+Logic.swift.
This file is an example of an extension. Basically code for a defined object that retroactively extends the capabilities of the original object by 
appending new functions or behaviors. One use for extensions which I am doing so in this code is that the user interaction is handled in the 
original ViewController.swift but the logic for performing the mathemathical functions is defined in ViewController+Logic.swift as a way to
separate interaction from business logic. The problems of massive viewcontroller logic prevalent in an MVC pattern architecture can be
mitigated by such techniques and for decades I have wondered why others have so foolishly opted to introduce architectures such as MVVM
that in reality, in my experience and in my opinion does not solve massive logic at all.

Finally the ListViewController is just a standard implementation of a classic TableViewController pattern with DataSource and Delegate.
It takes a list of operations recorded by the ViewController and merely displays the list but it also adds a **Done** button at the top of the list
as a way for a user to dismiss the list. The user can also drag the entire list down to the bottom edge of the screen to dismiss it in iOS 13.

AppDelegate.swift and SceneDelegate.swift will contain extra logic indended for iOS 13. But they are constarined by swift *@* attributes so that
the code can be compiled for iOS 12.
