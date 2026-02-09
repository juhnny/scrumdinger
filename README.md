# Scrumdinger

Apple iOS tutorial 

Link: https://developer.apple.com/tutorials/app-dev-training

## SwiftUI essentials
## Views
## Navigation and modal presentation

## Passing Data
### passing data with bindings

## State Management
### Making classes observable
### Responding to events
#### Scene
A scene is part of an app’s user interface with a life cycle that the system manages.

With the @main attribute, you inform the system that this is the only entry point to your app.

Scenes are containers for a view hierarchy.

SwiftUI provides concrete scenes like WindowGroup.

The system manages the life cycle of scenes and displays the view hierarchy that’s platform- and context-appropriate. For example, multitasking on iPadOS can simultaneously display multiple smaller instances of the same app.

#### Scene phases and transitions

During app execution, a scene can transition between three phases:

- active—A scene is in the foreground, and the user can interact with it.

- inactive—The scene is visible, but the system disabled interaction with the scene. For example, in multitasking mode, you can see your app’s panel alongside others, but it isn’t the active panel.

- background—The app is running, but the scene isn’t visible in the user interface. A scene enters this phase prior to app termination.

You can read the current state of a scene using the scenePhase environment value. Sometimes, you’ll want your app to perform a set of actions when the scene transitions to another phase.

#### Events and state

SwiftUI follows declarative programming patterns. In a SwiftUI view body, you describe how the user interface appears for every state. 

An event like a user interaction or notification causes an app to respond. A closure runs in response to the event, which might result in a mutation in the source of truth. After observing a mutation, SwiftUI updates the view and renders the user interface.

#### View life cycle events

SwiftUI includes modifiers that respond to view life cycle events:

- onAppear(perform:) triggers actions any time the view appears on screen, even if it’s not the first time.
- onDisappear(perform:) triggers actions when a view disappears from screen.

### Managing state and lifecycle
### Updating app data

## Persistence and error handling
### Persisting data
### Handling errors

## Drawing
## Recording audio
## UIKit essentials
## Collection views and navigation
## Making editable views
## Adding, deleting, and filtering reminders
## Custom views and animation
## System frameworks
## Tests
## Network data
## macOS essentials
## Navigation
## SwiftData
## Core macOS features
## Other frameworks
## Design
