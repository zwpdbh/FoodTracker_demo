//
//  FoodTrackerTests.m
//  FoodTrackerTests
//
//  Created by zwpdbh on 2018/7/7.
//  Copyright © 2018 Otago. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Meal.h"

@interface FoodTrackerTests : XCTestCase

@end

@implementation FoodTrackerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testMealInitializationSucceeds {
    Meal *zeroRatingMeal = [[Meal alloc] initWithName:@"zero" withPhoto:NULL andRating:0];
    XCTAssertNotNil(zeroRatingMeal);
    
    Meal *positiveRatingMeal = [[Meal alloc] initWithName:@"positive" withPhoto:NULL andRating:5];
    XCTAssertNotNil(positiveRatingMeal);
}

- (void) testMealInitializationFails {
    Meal *negativeRatingMeal = [[Meal alloc] initWithName:@"negative" withPhoto:NULL andRating:-1];
    XCTAssertNil(negativeRatingMeal);
    
    Meal *emptyStringMeal = [[Meal alloc] initWithName:@"" withPhoto:NULL andRating:0];
    XCTAssertNil(emptyStringMeal);
}


@end
