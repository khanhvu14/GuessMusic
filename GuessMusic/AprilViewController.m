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
@synthesize answerTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // rotate background
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rotate:) userInfo:nil repeats:YES];
    
    
    // bind event when click button
    [(UIButton *)[self.view viewWithTag:200] addTarget:self action:@selector(btnStopClick:) forControlEvents:UIControlEventTouchUpInside];
    [(UIButton *)[self.view viewWithTag:201] addTarget:self action:@selector(btnContinueClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // text field
    answerTextField = (UITextField *)[self.view viewWithTag:300];
    answerTextField.delegate = self;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
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


- (IBAction)btnStopClick:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"stop" message:@"stop" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
    [alert show];
}
- (IBAction)btnContinueClick:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"continue" message:@"continue" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
    [alert show];
}


- (void)keyboardWasShown:(NSNotification *)notification
{
    
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // Step 2: Change position of View
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    
    // Step 3: Scroll position of TextField
    CGPoint scrollPoint = CGPointMake(0, self.answerTextField.frame.origin.y - (keyboardSize.height-65));
    [scrollView setContentOffset:scrollPoint animated:YES];
}

- (void) keyboardWillHide:(NSNotification *)notification {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

// Dismiss the keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.answerTextField resignFirstResponder];
    return YES;
}


@end
