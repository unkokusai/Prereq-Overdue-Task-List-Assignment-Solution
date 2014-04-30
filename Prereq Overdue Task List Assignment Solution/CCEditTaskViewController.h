//
//  CCEditTaskViewController.h
//  Prereq Overdue Task List Assignment Solution
//
//  Created by Yasuyuki Pham on 4/30/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCEditTaskViewController : UIViewController



@property (strong, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *tastkDetailTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *taskDatePicker;


- (IBAction)saveBarButtonPressed:(UIBarButtonItem *)sender;

@end
