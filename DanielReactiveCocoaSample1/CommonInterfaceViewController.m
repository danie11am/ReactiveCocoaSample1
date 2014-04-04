//
//  CommonInterfaceViewController.m
//  DanielReactiveCocoaSample1
//
//  Created by Daniel Lam on 5/04/2014.
//  Copyright (c) 2014 Daniel Lam. All rights reserved.
//

#import "CommonInterfaceViewController.h"

@interface CommonInterfaceViewController ()

@end

@implementation CommonInterfaceViewController

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
    
    [self addUIComponents];

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



- (void)addUIComponents
{
    
    // Create the UI components.
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = @"Title";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor grayColor];
    [titleLabel sizeToFit];
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    nameLabel.text = @"Name";
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor grayColor];
    [nameLabel sizeToFit];
    [nameLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    
    UITextField *nameField = [[UITextField alloc] init];
    nameField.backgroundColor = [UIColor whiteColor];
    nameField.translatesAutoresizingMaskIntoConstraints = NO;
    nameField.placeholder = @"Enter name";
    
    UIButton *submitButton = [[UIButton alloc] init];
    submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [submitButton setTitle: @"Submit" forState: UIControlStateNormal];
    [submitButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    [submitButton setTitleColor: [UIColor lightGrayColor] forState: UIControlStateHighlighted];
    [submitButton sizeToFit];
    
    [self.view addSubview: titleLabel];
    [self.view addSubview: nameLabel];
    [self.view addSubview: nameField];
    [self.view addSubview: submitButton];

    // Save them to properties so that subclass can access them.
    self.titleLabel = titleLabel;
    self.nameLabel = nameLabel;
    self.nameField = nameField;
    self.submitButton = submitButton;
    
    
    // Set auto-layout constraints for the UI components.
    
    int GAP = 20;
    
    NSArray *allConstraints = @[
                                // Set Title label
                                // ...to be in upper half of screen.
                                [NSLayoutConstraint constraintWithItem: titleLabel
                                                             attribute: NSLayoutAttributeCenterY
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.view
                                                             attribute: NSLayoutAttributeCenterY
                                                            multiplier: 0.3
                                                              constant: 0
                                 ],
                                // ...to be horizontally centered.
                                [NSLayoutConstraint constraintWithItem: titleLabel
                                                             attribute: NSLayoutAttributeCenterX
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.view
                                                             attribute: NSLayoutAttributeCenterX
                                                            multiplier: 1.0
                                                              constant: 0
                                 ],
                                // Set Name label
                                // ...to be below Title label.
                                [NSLayoutConstraint constraintWithItem: nameLabel
                                                             attribute: NSLayoutAttributeTop
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: titleLabel
                                                             attribute: NSLayoutAttributeBottom
                                                            multiplier: 1.0
                                                              constant: 30
                                 ],
                                // ...align to left of screen, with some gap.
                                [NSLayoutConstraint constraintWithItem: nameLabel
                                                             attribute: NSLayoutAttributeLeft
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.view
                                                             attribute: NSLayoutAttributeLeft
                                                            multiplier: 1.0
                                                              constant: GAP
                                 ],
                                // Set Name field
                                // ...to be right of Name label.
                                [NSLayoutConstraint constraintWithItem: nameField
                                                             attribute: NSLayoutAttributeLeft
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nameLabel
                                                             attribute: NSLayoutAttributeRight
                                                            multiplier: 1.0
                                                              constant: GAP
                                 ],
                                // ...align to right of screen, with some gap.
                                [NSLayoutConstraint constraintWithItem: nameField
                                                             attribute: NSLayoutAttributeRight
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.view
                                                             attribute: NSLayoutAttributeRight
                                                            multiplier: 1.0
                                                              constant: -GAP
                                 ],
                                // ...on same level as Name label.
                                [NSLayoutConstraint constraintWithItem: nameField
                                                             attribute: NSLayoutAttributeCenterY
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nameLabel
                                                             attribute: NSLayoutAttributeCenterY
                                                            multiplier: 1.0
                                                              constant: 0
                                 ],
                                // Set Submit button
                                // ...to be horizontally centered.
                                [NSLayoutConstraint constraintWithItem: submitButton
                                                             attribute: NSLayoutAttributeCenterX
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: self.view
                                                             attribute: NSLayoutAttributeCenterX
                                                            multiplier: 1.0
                                                              constant: 0
                                 ],
                                // ...to be below name label.
                                [NSLayoutConstraint constraintWithItem: submitButton
                                                             attribute: NSLayoutAttributeTop
                                                             relatedBy: NSLayoutRelationEqual
                                                                toItem: nameLabel
                                                             attribute: NSLayoutAttributeBottom
                                                            multiplier: 1.0
                                                              constant: 20
                                 ]
                                ];
    
    [self.view addConstraints: allConstraints];
    
}




@end
