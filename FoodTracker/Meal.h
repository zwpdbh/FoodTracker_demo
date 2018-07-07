//
//  Meal.h
//  FoodTracker
//
//  Created by zwpdbh on 2018/7/7.
//  Copyright © 2018 Otago. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Meal : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage* photo;
@property (nonatomic, assign) NSInteger rating;

-(instancetype) initWithName: (NSString *)name withPhoto: (UIImage *)photo andRating: (NSInteger)rating;
@end
