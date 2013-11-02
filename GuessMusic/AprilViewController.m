//
//  AprilViewController.m
//  GuessMusic
//
//  Created by April Coder on 10/26/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import "AprilViewController.h"
#import "AprilViewPointViewController.h"
#import "UIViewController+MJPopupViewController.h"

@interface AprilViewController ()

@end

@implementation AprilViewController
@synthesize imageViewBG;
@synthesize imageViewLayOut;
@synthesize scrollView;
@synthesize answerTextField;
@synthesize imageView1, imageView2, imageView3, imageView4;
@synthesize currentSong;
@synthesize arrSongs;
@synthesize currentAnswer, currentPoint, userPoint;

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
    //status bar
    NSString *reqSysVer = @"6.1.3";
    NSLog(@"%@", [[UIDevice currentDevice] systemVersion]);
    if ([[[UIDevice currentDevice] systemVersion] compare:reqSysVer options:NSNumericSearch] != NSOrderedDescending){
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        NSLog(@"here");
    }
    // scroll view
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard)];
    
    // prevents the scroll view from swallowing up the touch event of child buttons
    tapGesture.cancelsTouchesInView = NO;
    
    [scrollView addGestureRecognizer:tapGesture];
    
    
    // image view
    imageView1 = (UIImageView *)[self.view viewWithTag:502];
    imageView1.contentMode = UIViewContentModeScaleToFill;
    imageView2 = (UIImageView *)[self.view viewWithTag:503];
    imageView2.contentMode = UIViewContentModeScaleToFill;
    imageView3 = (UIImageView *)[self.view viewWithTag:504];
    imageView3.contentMode = UIViewContentModeScaleToFill;
    imageView4 = (UIImageView *)[self.view viewWithTag:505];
    imageView4.contentMode = UIViewContentModeScaleToFill;
    /* load data from file */
    currentSong = 0;
    userPoint = 0;
    arrSongs = [[NSMutableArray alloc] init];
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"plist"];
    NSArray *dataFromPlist =[[NSArray alloc]init];
    dataFromPlist = [NSArray arrayWithContentsOfFile:plistPath];
    for(NSString *song in dataFromPlist)
    {
        [arrSongs addObject:song];
    }

    NSString *song = [arrSongs objectAtIndex:currentSong];
    NSArray* objSong = [song componentsSeparatedByString: @","];
    currentAnswer = [objSong objectAtIndex:0];
    currentPoint = [[objSong objectAtIndex:5] intValue];
    imageView1.image = [UIImage imageNamed:[objSong objectAtIndex:1]];
    imageView2.image = [UIImage imageNamed:[objSong objectAtIndex:2]];
    imageView3.image = [UIImage imageNamed:[objSong objectAtIndex:3]];
    imageView4.image = [UIImage imageNamed:[objSong objectAtIndex:4]];
    //returnArrayList = [arrayInArray objectAtIndex:0];
    
}

- (void) loadNextSong{
    /* reset old data */
    answerTextField.text = @"";
    currentSong = currentSong+1;
    if(currentSong > [arrSongs count]-1){
        currentSong = 0;
    }
    NSString *song = [arrSongs objectAtIndex:currentSong];
    NSArray* objSong = [song componentsSeparatedByString: @","];
    currentAnswer = [objSong objectAtIndex:0];
    currentPoint = [[objSong objectAtIndex:5] intValue];
    imageView1.image = [UIImage imageNamed:[objSong objectAtIndex:1]];
    imageView2.image = [UIImage imageNamed:[objSong objectAtIndex:2]];
    imageView3.image = [UIImage imageNamed:[objSong objectAtIndex:3]];
    imageView4.image = [UIImage imageNamed:[objSong objectAtIndex:4]];
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
    AprilViewPointViewController *detailViewController = [[AprilViewPointViewController alloc] initWithNibName:@"AprilViewPoint" bundle:nil];
    detailViewController.point = userPoint;
    [self presentPopupViewController:detailViewController animationType:0];
}
- (IBAction)btnContinueClick:(id)sender{
    NSString *userAnswer = answerTextField.text;
    if([[userAnswer lowercaseString] isEqualToString:[currentAnswer lowercaseString]]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Excellent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        userPoint = userPoint + currentPoint;
        [self loadNextSong];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Wrong Answer" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
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

- (void) dissmissKeyboard{
    [self.answerTextField resignFirstResponder];
}

@end
