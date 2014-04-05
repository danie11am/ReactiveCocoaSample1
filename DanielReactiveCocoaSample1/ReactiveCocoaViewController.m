//
//  ReactiveCocoaViewController.m
//  DanielReactiveCocoaSample1
//
//  Created by Daniel Lam on 3/04/2014.
//  Copyright (c) 2014 Daniel Lam. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ReactiveCocoaViewController.h"

@interface ReactiveCocoaViewController ()

@end

@implementation ReactiveCocoaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor yellowColor];

    self.titleLabel.text = @"ReactiveCocoa programming style";

    [self setupSignalGraph];
}



/**
 Setup a "signal graph" that by:
 
 - Creating ReactiveCocoa signals from different sources.
 - Transform/combine these signals if needed.
 - Subscribe to thesse signals and take corresponding actions.
 
 */
- (void) setupSignalGraph
{
    // Create signals.
    
    // Create a signal that will send Next value whenever there is a change in nameField.
    // If the length of nameField content is >= 5, the Next value will be YES, otherwise, it will be NO.
    //
    // Note that if this signal is not subscribed to, i.e. without the subscribeNext: code block below,
    // the codes inside the "map" code block actually will not be called.
    //
    RACSignal *nameIsValidSignal = [self.nameField.rac_textSignal map:^id(NSString *value) {
        
        NSLog(@"Incoming into nameIsValidSignal: %@", value);
        return @(value.length >= 5);
    }];
    
    // Create a signal that will send the Next value whenever Submit button is tapped.
    RACSignal *buttonTappedSignal = [self.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    
    // Create a signal that is the same as nameIsValidSignal, except that it only sends value when button is tapped.
    RACSignal *buttonTappedSignalWithInfo = [nameIsValidSignal sample: buttonTappedSignal];
    
    
    
    // Subscribe to signals.
    
    // Subscribe to the nameIsValidSignal and change Star symbol color according to its value.
    [nameIsValidSignal subscribeNext: ^(NSNumber *isNameValid) {
        
        NSLog(@"Next value from nameIsValidSignal: %@", isNameValid);
        
        if (isNameValid.boolValue) {
            self.starLabel.textColor = self.VALID_STAR_COLOR;
        } else {
            self.starLabel.textColor = self.INVALID_STAR_COLOR;
        }
        
    }];
    
    // Subscribe to buttonTappedSignalWithInfo to respond to Submit button click event.
    [buttonTappedSignalWithInfo subscribeNext:^(NSNumber *isNameValid) {
        
        NSLog(@"buttonTappedSignalWithInfo next value sent: %@", isNameValid);
        
        NSString *message;
        
        if (isNameValid.boolValue) {
            message = [NSString stringWithFormat: @"Welcome %@!", self.nameField.text];
            
        } else {
            message = @"Name is too short.";
        }
        
        UIAlertView *popup = [[UIAlertView alloc] initWithTitle: @""
                                                        message: message
                                                       delegate: nil
                                              cancelButtonTitle: @"OK"
                                              otherButtonTitles: nil, nil
                              ];
        [popup show];
    }];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
