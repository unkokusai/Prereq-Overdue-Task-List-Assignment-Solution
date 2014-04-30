//
//  CCAddTaskViewController.h
//  Prereq Overdue Task List Assignment Solution
//
//  Created by Yasuyuki Pham on 4/30/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddTaskViewControllerDelegate <NSObject>

@required

-(void)addTask;
-(void)cancelTask;

@end

@interface CCAddTaskViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) id <AddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDetailTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *taskDatePicker;


- (IBAction)addTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end


