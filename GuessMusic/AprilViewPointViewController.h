//
//  AprilViewPointViewController.h
//  GuessMusic
//
//  Created by April Coder on 11/2/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AprilViewPointViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbUser;
@property (weak, nonatomic) IBOutlet UILabel *lbPoint;
@property (nonatomic) int point;
@end
