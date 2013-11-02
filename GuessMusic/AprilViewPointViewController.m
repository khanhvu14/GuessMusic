//
//  AprilViewPointViewController.m
//  GuessMusic
//
//  Created by April Coder on 11/2/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import "AprilViewPointViewController.h"

@interface AprilViewPointViewController ()

@end

@implementation AprilViewPointViewController
@synthesize lbPoint, lbTitle, lbUser;
@synthesize point;

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
    lbTitle = (UILabel *)[self.view viewWithTag:110];
    lbUser = (UILabel *)[self.view viewWithTag:111];
    lbPoint = (UILabel *)[self.view viewWithTag:112];
    lbPoint.text = [NSString stringWithFormat:@"%d", point];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
