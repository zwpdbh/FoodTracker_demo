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
@property (nonatomic) NSInteger rating;

@end

@implementation RatingControlView

-(NSInteger)startCount
{
    return 5;
}

-(CGSize)startSize
{
    return CGSizeMake(44.0, 44.0);
}

-(void)setStartCount:(NSInteger)startCount
{
    self.startCount = startCount;
    [self setupButtons];
}

-(void)setStartSize:(CGSize)startSize
{
    self.startSize = startSize;
    [self setupButtons];
}

-(void)ratingButtonTapped: (UIButton *)button
{
    NSLog(@"button pressed 😀");
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
    for (int i = 0; i < self.startCount; i++) {
        UIButton* button = [[UIButton alloc] init];
        [button setBackgroundColor:[UIColor redColor]];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[button.heightAnchor constraintEqualToConstant:self.startSize.height] setActive:YES];
        [[button.widthAnchor constraintEqualToConstant:self.startSize.width] setActive:YES];
        
        // used the target-action pattern to link elements to action methods.
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents: UIControlEventTouchUpInside];
        
        [self addArrangedSubview:button];
        [self.buttons addObject:button];
    }
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
