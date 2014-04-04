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
    [super viewDidLoad];

    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];

    self.titleLabel.text = @"Traditional programming style";

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
