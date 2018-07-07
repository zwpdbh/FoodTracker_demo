//
//  MealTableViewCell.h
//  FoodTracker
//
//  Created by zwpdbh on 2018/7/7.
//  Copyright © 2018 Otago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControlView.h"

@interface MealTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControlView *ratingControlView;
@end
