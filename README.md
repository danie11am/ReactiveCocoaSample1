
## Overview

A sample app to illustrate the use of [ReactiveCocoa framework](https://github.com/ReactiveCocoa). More details in this [blog post](http://daniellam.me/blog/adventure-to-reactivecocoa-land/).

It also illustrates the use of other iOS frameworks/coding practice including:

- Auto Layout
- UITabBarController
- Code-reuse by implementing subclasses
- UI done programmatically - no storyboards/nib files
- Using git submodule


## Running the app

1. Clone it.
2. Get the ReactiveCocoa submodule and all its submodules by running

    git submodule update --init --recursive


## Behavior

There are two tabs in the app. They have the exact same UI components and behavior. 

One is coded using traditional delegate/callback approach while the other one is coded using ReactiveCocoa.

The behavior is as follows:

- When the name is "valid", i.e. length >= 5 characters,
  - The star symbol will turn to blue,
  - Otherwise it will be in light gray.
- When the "Submit" button is tapped,
  - It will say "Name is too short" if name is invalid, 
  - Otherwise it will say "Welcome <name>".
