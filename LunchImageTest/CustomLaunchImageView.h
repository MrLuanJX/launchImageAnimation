//
//  CustomLaunchImageView.h
//  LunchImageTest
//
//  Created by 栾金鑫 on 2020/2/27.
//  Copyright © 2020 bestdew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomLaunchImageView : UIView

// 启动图动画
- (void)showOnView:(UIView *)containerView withAnimationCompleter:(void(^)(void))completer;

@end

NS_ASSUME_NONNULL_END
