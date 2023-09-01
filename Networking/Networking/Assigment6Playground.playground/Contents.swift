import UIKit

var greeting = "Hello, playground"
// Assignment

// Create a class for which you should be able to create only 3 objects ,if more 3 object is created than throw an error

enum InstantiationError: Error {
    case capacityExhausted
    case systemError
}

class Employee{
    static var numberOfCreatedObjects = 0
    init()   {
        self.getInstance()
            
    }
   
    private func getInstance() -> Employee {
      
        do{
            try createInstance()
            print("created")
        }catch{
            print("\(error)")
        }
        return Employee()
    }
    private func createInstance() throws {
        if Employee.numberOfCreatedObjects > 2 {
            throw InstantiationError.capacityExhausted
        }
        Employee.numberOfCreatedObjects += 1
        
    }
}


var employes = [Employee]()
for i in 0 ... 4 {
    let temp = Employee()
    employes.append(temp)
    print(i)
}



//===================================

// App States

// 5 states

  // 1. Not running
// App is been terminated by the system or user
  // 2. In active
// This is a transition state for instance when a call comes in or user presses the home button where the App is visible on the screen but the user cannot interact with it
  // 3. Active
// The App is visible on the screen and  can respond to user interaction at this state
  // 4. Background
// The App is not longer visible to the user but it can perform certain task such as play music or update location or fetch data
  // 5. Suspended
// The App is in memory but not performing any tasks and can be terminated by the system to recover the memory the App is occupying



// App life cycle methods

//didFinishLaunchingWithOptions
// Called when the App is launched
//sceneWillEnterForeground
//Called when the App is visible on the screen
//sceneDidBecomeActive
//Called  when the App is in responsive state
//sceneWillResignActive
// Called when the App enters inactive state
//sceneDidEnterBackground -> Called when the App is in background state


// View Controller life cycle methods


//viewDidLoad -> View has been loaded into memory, where to make one-time setups, UI initialization and data fetching
//viewWillAppear -> Called when the view is about to be visible on the screen
//viewDidAppear -> Called when the view is fully visible to on the screen and it is where to make UI data updaes
//viewWillDisappear ->  The view is about to be removed from the screen
//viewDidDisappear -> The view is removed from the screen, where to perform clean-up tasks, pause animation and save data

// ==============
