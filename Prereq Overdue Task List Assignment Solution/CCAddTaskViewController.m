//
//  CCAddTaskViewController.m
//  Prereq Overdue Task List Assignment Solution
//
//  Created by Yasuyuki Pham on 4/30/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import "CCAddTaskViewController.h"

@interface CCAddTaskViewController ()

@end

@implementation CCAddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskDetailTextView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addTaskButtonPressed:(UIButton *)sender
{
    NSMutableArray *plistTaskArray = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_ARRAY_KEY] mutableCopy];
    if (!plistTaskArray) {
        plistTaskArray = [[NSMutableArray alloc] init];
    }
    NSLog(@"cool: %@", plistTaskArray);
    
    NSDictionary *taskDictionary = [self addTask:self.taskTitleTextField.text withDetail:self.taskDetailTextView.text withDate:self.taskDatePicker.date andCompletionStatus:@"NO"];

    [plistTaskArray addObject:taskDictionary];
    NSLog(@"%@", plistTaskArray);
    [[NSUserDefaults standardUserDefaults] setObject:plistTaskArray forKey:TASK_ARRAY_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.delegate addTask];
}

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.delegate cancelTask];
}

#pragma mark - Helper Methods

//#define TASK_TITLE @"taskTitle"
//#define TASK_DETAIL @"taskDetail"
//#define TASK_DATE @"taskDate"
//#define TASK_COMPLETION_STATUS @"taskCompletionStatus"

-(NSDictionary *)addTask:(NSString *)title withDetail:(NSString *)detail withDate:(NSDate *)date andCompletionStatus:(NSString *)completed
{
    NSDictionary *task = @{TASK_TITLE : title, TASK_DETAIL : detail, TASK_DATE : date, TASK_COMPLETION_STATUS : completed};
    return task;
}

    
#pragma mark - UITextView Delegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}


@end
