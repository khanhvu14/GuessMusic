//
//  AprilViewController.h
//  GuessMusic
//
//  Created by April Coder on 10/26/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AprilViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *imageViewBG;
@property (nonatomic, weak) IBOutlet UIImageView *imageViewLayOut;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic, weak) IBOutlet UITextField *answerTextField;
@property (nonatomic, weak) IBOutlet UIImageView *imageView1;
@property (nonatomic, weak) IBOutlet UIImageView *imageView2;
@property (nonatomic, weak) IBOutlet UIImageView *imageView3;
@property (nonatomic, weak) IBOutlet UIImageView *imageView4;
@property (nonatomic) int currentSong;
@property (nonatomic, strong) NSMutableArray *arrSongs;
@property (nonatomic, strong) NSString *currentAnswer;
@property (nonatomic) int currentPoint;
@property (nonatomic) int userPoint;

- (IBAction)btnStopClick:(id)sender;
- (IBAction)btnContinueClick:(id)sender;

@end
