//
//  MealTableViewController.m
//  FoodTracker
//
//  Created by zwpdbh on 2018/7/7.
//  Copyright © 2018 Otago. All rights reserved.
//

#import "MealTableViewController.h"
#import "MealTableViewCell.h"
#import "Meal.h"
#import "MealViewController.h"

@interface MealTableViewController ()

@end

@implementation MealTableViewController

-(IBAction)unwindFromMealViewController:(UIStoryboardSegue *)segue {
    
    if ([segue.sourceViewController isKindOfClass:[MealViewController class]]) {
        MealViewController *mealVC = (MealViewController *)segue.sourceViewController;
        if (mealVC.meal) {
            NSIndexPath *indexPath  = [NSIndexPath indexPathForRow:self.meals.count inSection:0];
            NSMutableArray *indexPathArray = [[NSMutableArray alloc] initWithCapacity:1];
            [indexPathArray addObject:indexPath];
            [self.meals addObject: mealVC.meal];
            [self.tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}


- (void)loadSampleMeals
{
    UIImage *photo1 = [UIImage imageNamed:@"meal1" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:NULL];;
    UIImage *photo2 = [UIImage imageNamed:@"meal2" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:NULL];
    UIImage *photo3 = [UIImage imageNamed:@"meal3" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:NULL];
    
    Meal *meal1 = [[Meal alloc] initWithName:@"Caprese Salad" withPhoto:photo1 andRating:4];
    Meal *meal2 = [[Meal alloc] initWithName:@"Chicken and Potatoes" withPhoto:photo2 andRating:5];
    Meal *meal3 = [[Meal alloc] initWithName:@"Pasta with Meatballs" withPhoto:photo3 andRating:3];
    
    [self.meals addObject:meal1];
    [self.meals addObject:meal2];
    [self.meals addObject:meal3];
}

- (NSMutableArray *)meals
{
    if (!_meals) {
        _meals = [[NSMutableArray alloc] init];
    }
    return _meals;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSampleMeals];
    NSLog(@"Load %lu meals", (unsigned long)[self.meals count]);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"number of rows = %lu", (unsigned long)[self.meals count]);
    return [self.meals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MealTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSLog(@"😅");
    
    if ([cell isKindOfClass:[MealTableViewCell class]]) {
        MealTableViewCell *eachCell = (MealTableViewCell *)cell;
        Meal *meal = [self.meals objectAtIndex:indexPath.row];
        eachCell.nameLabel.text = meal.name;
        eachCell.photoImageView.image = meal.photo;
        eachCell.ratingControlView.rating = (int)meal.rating;
        
        return eachCell;
    } else {
        return NULL;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
