//
//  RatingControlView.m
//  FoodTracker
//
//  Created by zwpdbh on 2018/7/6.
//  Copyright © 2018 Otago. All rights reserved.
//

#import "RatingControlView.h"


@interface RatingControlView()
@property (strong, nonatomic) NSMutableArray *buttons;
@property (nonatomic) int rating;
@end

@implementation RatingControlView

-(void)setStartCount:(int)startCount
{
    _startCount = startCount;
    [self setupButtons];
    NSLog(@"set startCount");
}

-(void)setStartSize:(CGSize)startSize
{
    _startSize = startSize;
    [self setupButtons];
    NSLog(@"set startSize");
}

-(void)setRating:(int)rating
{
    _rating = rating;
    NSLog(@"didset rating 😀");
    [self updateButtonSelectionStates];
}

-(void)updateButtonSelectionStates
{
//    for (UIButton *eachButton in self.buttons) {
//        if ([self.buttons indexOfObject:eachButton] < self.rating) {
//            [eachButton setSelected:YES];
//            NSLog(@"")
//        }
//    }
    for (int i = 0;  i < [self.buttons count]; i++) {
        if (i <= self.rating - 1) {
            [[self.buttons objectAtIndex:i] setSelected:YES];
        } else {
            [[self.buttons objectAtIndex:i] setSelected:NO];
        }
    }
    
}

-(void)ratingButtonTapped: (UIButton *)button
{
//    NSLog(@"button pressed 😀");
    int index = (int)[self.buttons indexOfObject:button];
    int selectedRating = index + 1;
    if (selectedRating == self.rating) {
        self.rating = 0;
    } else {
        self.rating = selectedRating;
    }
}

-(NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc]init];
    }
    return _buttons;
}

-(void)setupButtons
{
    for (UIButton *eachButton in self.buttons) {
        [self removeArrangedSubview:eachButton];
        [eachButton removeFromSuperview];
    }
    [self.buttons removeAllObjects];
    
    // load button images
    UIImage *filledStar = [UIImage imageNamed:@"filledStar" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:NULL];
    UIImage *emptyStar = [UIImage imageNamed:@"emptyStar" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:NULL];
    UIImage *highlightedStar = [UIImage imageNamed:@"highlightedStar" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:NULL];
    
    
    for (int i = 0; i < self.startCount; i++) {
        UIButton* button = [[UIButton alloc] init];
//        [button setBackgroundColor:[UIColor redColor]];
        [button setImage:emptyStar forState:(UIControlState)UIControlStateNormal];
        [button setImage:filledStar forState:UIControlStateSelected];
        [button setImage:highlightedStar forState:UIControlStateHighlighted];
        [button setImage:highlightedStar forState:(UIControlStateHighlighted | UIControlStateSelected)];
        
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[button.heightAnchor constraintEqualToConstant:self.startSize.height] setActive:YES];
        [[button.widthAnchor constraintEqualToConstant:self.startSize.width] setActive:YES];
        
        // used the target-action pattern to link elements to action methods.
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents: UIControlEventTouchUpInside];
        
        [self addArrangedSubview:button];
        [self.buttons addObject:button];
    }
    [self updateButtonSelectionStates];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.startSize = CGSizeMake(44.0, 44.0);
        self.startCount = 5;
        
        [self setupButtons];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupButtons];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
