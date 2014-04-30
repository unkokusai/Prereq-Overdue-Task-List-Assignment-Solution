//
//  CCDetailTaskViewController.h
//  Prereq Overdue Task List Assignment Solution
//
//  Created by Yasuyuki Pham on 4/30/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCDetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDateLabel;
@property (strong, nonatomic) IBOutlet UITextView *tastkDetailTextView;

- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender;

@end
