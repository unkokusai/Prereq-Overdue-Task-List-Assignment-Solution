//
//  CCTableViewController.m
//  Prereq Overdue Task List Assignment Solution
//
//  Created by Yasuyuki Pham on 4/30/14.
//  Copyright (c) 2014 Code Coalition. All rights reserved.
//

#import "CCTableViewController.h"

@interface CCTableViewController ()

@end

@implementation CCTableViewController

// lazy instantiations
-(NSMutableArray *)taskDictionaryArray
{
    if (!_taskDictionaryArray) {
        _taskDictionaryArray = [[NSMutableArray alloc] init];
    }
    return _taskDictionaryArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSArray *plistTaskArray = [[NSUserDefaults standardUserDefaults] arrayForKey:TASK_ARRAY_KEY];
    
    for (NSDictionary *dictionary in plistTaskArray)
    {
        [self.taskDictionaryArray addObject:dictionary];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.taskDictionaryArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *IdentifierCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IdentifierCell forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *taskDictionary = self.taskDictionaryArray[indexPath.row];
    cell.textLabel.text = taskDictionary[TASK_TITLE];
    cell.detailTextLabel.text = taskDictionary[TASK_DETAIL];
    if ([taskDictionary[TASK_COMPLETION_STATUS] isEqualToString:@"NO"]) {
        cell.backgroundColor = [UIColor blueColor];
    }
    if ([[self checkOverdue:taskDictionary[TASK_DATE]] isEqualToString:@"YES"]  ) {
        cell.backgroundColor = [UIColor redColor];
    }
    // implement method to check whether overdue
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        if ([segue.destinationViewController isKindOfClass:[CCAddTaskViewController class]]) {
            self.addTaskViewController = segue.destinationViewController;
            self.addTaskViewController.delegate = self;
        }
    }
}


- (IBAction)addTaskBarButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddTaskViewController" sender:sender];
}

- (IBAction)reorderBarButtonPressed:(UIBarButtonItem *)sender
{
    
}

#pragma mark - Helper methods

-(NSString *)checkOverdue:(NSDate *)date
{
    NSDate *currenDate = [NSDate date];
    if ([currenDate compare:date] == NSOrderedDescending) return @"YES";
    else return @"NO";
}

-(NSString *)formattedDate:(UIDatePicker *)datePicker
{
    /* Returns String of the date from datePicker */
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:datePicker.date];
    
    NSLog(@"%@", formattedDate);
    return formattedDate;
}

#pragma mark - AddTaskViewController Delegate

-(void)addTask
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

-(void)cancelTask
{
    [self dismissViewControllerAnimated:YES completion:nil];
}






@end
