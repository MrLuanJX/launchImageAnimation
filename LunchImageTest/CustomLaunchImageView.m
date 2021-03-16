//
//  CustomLaunchImageView.m
//  LunchImageTest
//
//  Created by 栾金鑫 on 2020/2/27.
//  Copyright © 2020 bestdew. All rights reserved.
//

#import "CustomLaunchImageView.h"

@implementation CustomLaunchImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    return self;
}

- (void)showOnView:(UIView *)containerView withAnimationCompleter:(void(^)(void))completer {
    if (!containerView) {
        return;
    }

    [containerView addSubview:self];
}
@end
