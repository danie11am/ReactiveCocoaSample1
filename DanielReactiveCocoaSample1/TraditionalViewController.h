//
//  TraditionalViewController.h
//  DanielReactiveCocoaSample1
//
//  Created by Daniel Lam on 3/04/2014.
//  Copyright (c) 2014 Daniel Lam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonInterfaceViewController.h"

@interface TraditionalViewController : CommonInterfaceViewController

/** This is set to YES when content of name field is considered valid (e.g. length >= 5). */
@property BOOL nameIsValid;

@end
