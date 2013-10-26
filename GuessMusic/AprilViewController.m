//
//  AprilViewController.m
//  GuessMusic
//
//  Created by April Coder on 10/26/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import "AprilViewController.h"

@interface AprilViewController ()

@end

@implementation AprilViewController
@synthesize imageViewBG;
@synthesize imageViewLayOut;
@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rotate:) userInfo:nil repeats:YES];
}
     
     
 - (IBAction)rotate:(id)sender{
     
     imageViewBG = (UIImageView *)[self.view viewWithTag:500];
     imageViewBG.transform = CGAffineTransformRotate(imageViewBG.transform, 0.25 * M_PI / 180);
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
