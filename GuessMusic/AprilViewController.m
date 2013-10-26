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
    imageViewBG = (UIImageView *)[self.view viewWithTag:500];
    //imageViewBG.frame = CGRectMake(10, 10, 20, 100);
    imageViewBG.contentMode = UIViewContentModeCenter;
    //imageViewBG.center = CGPointMake(self.imageViewBG.bounds.size.width/2, self.imageViewBG.bounds.size.height/2);
    /* initialize */
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(rotate:) userInfo:nil repeats:YES];
    
}
     
     
 - (IBAction)rotate:(id)sender{
     
     imageViewBG = (UIImageView *)[self.view viewWithTag:500];
     imageViewBG.transform = CGAffineTransformRotate(imageViewBG.transform, -50);
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
