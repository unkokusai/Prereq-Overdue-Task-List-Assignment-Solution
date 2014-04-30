//
//  CCTableViewController.h
//  Prereq Overdue Task List Assignment Solution
//
//  Created by Yasuyuki Pham on 4/30/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAddTaskViewController.h"

@interface CCTableViewController : UITableViewController <AddTaskViewControllerDelegate>

@property (strong, nonatomic) CCAddTaskViewController *addTaskViewController;
@property (strong, nonatomic) NSMutableArray *taskDictionaryArray;

- (IBAction)addTaskBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)reorderBarButtonPressed:(UIBarButtonItem *)sender;




//#define TASK_TITLE @"taskTitle"
//#define TASK_DETAIL @"taskDetail"
//#define TASK_DATE @"taskDate"
//#define TASK_COMPLETION_STATUS @"taskCompletionStatus"

@end
