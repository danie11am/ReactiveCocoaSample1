//
//  CommonInterfaceViewController.h
//  DanielReactiveCocoaSample1
//
//  Created by Daniel Lam on 5/04/2014.
//  Copyright (c) 2014 Daniel Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A view controller to set up the UI componenets. 
 
 Interactions are coded in subclasses to demonstrate how it can be done with the traditional way and 
 the ReactiveCocoa way.
 */
@interface CommonInterfaceViewController : UIViewController

@property UILabel *titleLabel;
@property UILabel *nameLabel;
@property UITextField *nameField;
@property UIButton *submitButton;

@end
