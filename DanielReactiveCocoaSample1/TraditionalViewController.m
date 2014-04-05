//
//  TraditionalViewController.m
//  DanielReactiveCocoaSample1
//
//  Created by Daniel Lam on 3/04/2014.
//  Copyright (c) 2014 Daniel Lam. All rights reserved.
//

#import "TraditionalViewController.h"

@interface TraditionalViewController ()

@end

@implementation TraditionalViewController

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
    // By calling viewDidLoad: of super class, all the interface components will be set up to appear.
    [super viewDidLoad];

    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];

    self.titleLabel.text = @"Traditional programming style";

    self.nameIsValid = NO;

    // Set up a callback function to be called whenever content of name field is changed.
    [self.nameField addTarget: self
                       action: @selector(nameFieldDidChange:)
             forControlEvents: UIControlEventEditingChanged
     ];

    // Set up a callback function to be called whenever button is clicked.
    [self.submitButton addTarget:self
                          action:@selector(submitButtonPressed)
                forControlEvents:UIControlEventTouchUpInside
     ];

}



/**
 Called when name field content is changed.
 */
- (void)nameFieldDidChange: (UITextField *) textField
{
    NSLog(@"Name field changed, content: %@", textField.text);

    // Change the color of the Star symbol depending on the length of entered name.
    if (textField.text.length >= 5) {
        self.starLabel.textColor = self.VALID_STAR_COLOR;
        self.nameIsValid = YES;

    } else {
        self.starLabel.textColor = self.INVALID_STAR_COLOR;
        self.nameIsValid = NO;
    }
}



/**
 Called when submit button is pressed.
 */
- (void) submitButtonPressed
{
    NSLog(@"submitButton is pressed!");
    
    NSString *message;

    if (self.nameIsValid) {
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
