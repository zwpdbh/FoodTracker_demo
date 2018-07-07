//
//  Meal.m
//  FoodTracker
//
//  Created by zwpdbh on 2018/7/7.
//  Copyright © 2018 Otago. All rights reserved.
//

#import "Meal.h"
@interface Meal()

@end

@implementation Meal

-(NSString *)name {
    if (!_name) {
        _name = [[NSString alloc] init];
    }
    return _name;
}

-(UIImage *)photo
{
    if (!_photo) {
        _photo = [[UIImage alloc] init];
    }
    return _photo;
}

-(instancetype) initWithName: (NSString *)name withPhoto: (nullable UIImage *)photo andRating: (NSInteger)rating
{
    if ([name length] == 0 || rating < 0 || rating > 5) {
        return NULL;
    }
    self = [super init];
    if (self) {
        self.name = name;
        self.photo = photo;
        self.rating = rating;
    }
    return self;
}
@end
