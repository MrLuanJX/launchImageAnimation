//
//  AppDelegate.m
//  LunchImageTest
//
//  Created by ckl@pmm on 2017/12/28.
//  Copyright © 2017年 pronetway. All rights reserved.
//

#import "AppDelegate.h"
#import "JHShimmer.h"
#import "ViewController.h"
#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kBounds [UIScreen mainScreen].bounds
#define newKwith (kWidth/375)
#define newKhight (kHeight/667)
#define kTabBarH        49.0f
#define kStatusBarH     20.0f
#define kNavigationBarH 44.0f
#define kNavBarHAndStaBarH 64.0f
#define kdefaultcellH 44*newKhight

static int space = 4;
@interface AppDelegate ()<CAAnimationDelegate>

{
    
    UILabel *myTest1;
    CABasicAnimation *animation;
    UIImageView *logoimageV;
}
@property(nonatomic,strong)UIImageView* LImg;
@property(nonatomic,strong)UIImageView* IImg;
@property(nonatomic,strong)JHShimmer* textLabel;
@property(nonatomic,strong)UILabel* btmLabel;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = nav;

    [self.window makeKeyAndVisible];
    
//    [self customLaunchImageView];

    [self lxxLaunchImageAnimation];
    
    return YES;
}

- (void)lxxLaunchImageAnimation {
    UIImageView *launchImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    launchImageView.image = [UIImage imageNamed:@"背景.jpg"];
    [self.window addSubview:launchImageView];
    [self.window bringSubviewToFront:launchImageView];
    
    self.LImg = [[UIImageView alloc] initWithFrame:CGRectMake((kWidth - 348/space)/2, (kHeight-594/space)/3, 348/space, 594/space)];
    self.LImg.image = [UIImage imageNamed:@"图层1"];
//    self.LImg.alpha = 0;
    [launchImageView addSubview:self.LImg];
    
    self.IImg = [[UIImageView alloc] initWithFrame:CGRectMake((kWidth - 111/space)/2, (kHeight-320/space)/3+10, 111/space, 320/space)];
    self.IImg.image = [UIImage imageNamed:@"图层 2"];
    self.IImg.alpha = 0;
    [launchImageView addSubview:self.IImg];
    
    self.textLabel = [[JHShimmer alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.LImg.frame) + 20, kWidth, 50)];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.text = @"让理想更近一步";
    self.textLabel.font = [UIFont systemFontOfSize:23 weight:1.5];
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.alpha = 0;
    [launchImageView addSubview:self.textLabel];
    
    self.btmLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(launchImageView.frame) - 100, kWidth, 50)];
    self.btmLabel.textAlignment = NSTextAlignmentCenter;
    self.btmLabel.text = @"Copyright © lixiangxue.cn";
    self.btmLabel.font = [UIFont systemFontOfSize:15];
    self.btmLabel.textColor = [UIColor colorWithRed:156/255.f green:156/255.f blue:156/255.f alpha:1.0];
    [launchImageView addSubview:self.btmLabel];
    
    //路径动画。
    CGMutablePathRef myPah = CGPathCreateMutable();
    CGPathMoveToPoint(myPah, nil,kWidth/2, (kHeight-594/space)/3);//最后的点的位置
    for (int i = 0; i<60; i++) {
        CGPathAddLineToPoint(myPah, nil, kWidth/2, (kHeight-594/space)/3 +i);
    }
    [self.LImg.layer addAnimation:[self keyframeAnimation:myPah durTimes:0.5f Rep:MAXFLOAT] forKey:nil];
    
    //路径动画。
    CGMutablePathRef iPath = CGPathCreateMutable();
    CGPathMoveToPoint(iPath, nil,(kWidth-111/space)/2 + 110, (kHeight-320/space)/3+10);//最后的点的位置
    for (int i = 0; i < 70; i++) {
        CGPathAddLineToPoint(iPath, nil, (kWidth-111/space)/2+110-i, (kHeight-320/space)/3+10);
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.IImg.alpha = 1;
        [self.IImg.layer addAnimation:[self keyframeAnimation:iPath durTimes:0.35f Rep:MAXFLOAT] forKey:nil];
    });
    
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [UIView animateWithDuration:1.6 animations:^{
           self.textLabel.alpha = 1;
           self.textLabel.shimmerWidth = 50;
           self.textLabel.shimmerColor = [UIColor lightGrayColor];//[UIColor colorWithRed:255/255.0 green:185/255.0 blue:15/255.0 alpha:1.0];
           self.textLabel.shimmerBackgroundColor = [UIColor clearColor];
           self.textLabel.style = JHShimmerStyle_Slanted;
           self.textLabel.animationStyle = JHShimmerAnimationStyle_EaseIn;
           self.textLabel.shimmerDuration = 2;
           self.textLabel.shimmerOnce = YES;
           [self.textLabel startShimmer];
       } completion:^(BOOL finished) {
           [UIView animateWithDuration:1.5 animations:^{
               launchImageView.alpha = 0.0;
               launchImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
           } completion:^(BOOL finished) {
               [launchImageView removeFromSuperview];
           }];
       }];
     });
}

- (void)customLaunchImageView {
    UIImageView *launchImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    launchImageView.image = [UIImage imageNamed:@"背景.jpg"];//[self getLaunchImage];
    
    [self.window addSubview:launchImageView];
    [self.window bringSubviewToFront:launchImageView];
    
    myTest1 = [[UILabel alloc]initWithFrame:CGRectMake(0,kHeight/2, 50, 50)];
    myTest1.backgroundColor = [UIColor colorWithRed:255/255.0f green:165.0/255.0f blue:0/255.0f alpha:1.0];
    myTest1.textAlignment = NSTextAlignmentCenter;
    myTest1.text = @"";
    myTest1.layer.masksToBounds = YES;
    myTest1.layer.cornerRadius = 25;
    myTest1.textColor = [UIColor whiteColor];//[UIColor colorWithRed:255/255.0f green:165.0/255.0f blue:0/255.0f alpha:1.0];
    [launchImageView addSubview:myTest1];
    
    logoimageV = [[UIImageView alloc]initWithFrame:CGRectMake((kWidth-300)/2, (kHeight-400)/2, 300, 300)];
    logoimageV.image = [UIImage imageNamed:@"图"];
    logoimageV.alpha  = 0;
    [launchImageView addSubview:logoimageV];
    
    //路径动画。
    CGMutablePathRef myPah = CGPathCreateMutable();
    //CGPathGetCurrentPoint(myPah);
    // CGPathMoveToPoint(myPah, nil,kWidth/2, kHeight/2);
    CGPathMoveToPoint(myPah, nil,0, kHeight/3);//最后的点的位置
    CGPathAddLineToPoint(myPah, nil, kWidth/6, kHeight-100);
    CGPathAddLineToPoint(myPah, nil, kWidth/3, kHeight-200);
    CGPathAddLineToPoint(myPah, nil, kWidth/2, kHeight-100);
    CGPathAddLineToPoint(myPah, nil, kWidth/2, kHeight/2);
    // CGPathRelease(myPah);
    //CGPathCloseSubpath(myPah);
        
    [myTest1.layer addAnimation:[self keyframeAnimation:myPah durTimes:1.4f Rep:MAXFLOAT] forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        myTest1.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            logoimageV.alpha = 1;
        } completion:^(BOOL finished) {}];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1.5 animations:^{
                launchImageView.alpha = 0.0;
                logoimageV.alpha = 1;
                launchImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                [launchImageView removeFromSuperview];
            }];
        });
    });
}

- (UIImage *)getLaunchImage
{
    UIImage *lauchImage = nil;
    NSString *viewOrientation = nil;
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        
        viewOrientation = @"Landscape";
        
    } else {
        
        viewOrientation = @"Portrait";
    }
    
    NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDictionary) {
        
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            
            lauchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    return lauchImage;
}


-(void)addlat {
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.duration = 1.5f;
    opacityAnimation.autoreverses= NO;
    // opacityAnimation.delegate = self;
    opacityAnimation.repeatCount = 1;
    //    opacityAnimation.speed = 1.0f;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithDouble:0.9];
    animation2.toValue = [NSNumber numberWithDouble:10];
    animation2.duration= 1.5;
    animation2.autoreverses= NO;
    animation2.repeatCount= 1;  //"forever"
    //    animation2.removedOnCompletion= YES;
    [myTest1.layer addAnimation:animation2 forKey:@"scale"];
    [myTest1.layer addAnimation:animation2 forKey:@"scale"];
    [myTest1.layer addAnimation:opacityAnimation forKey:nil];
    [myTest1.layer addAnimation:opacityAnimation forKey:nil];
    
}

#pragma mark =====路径动画-=============
-(CAKeyframeAnimation *)keyframeAnimation:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ///animation.autoreverses = NO;//是否原路返回
    animation.duration = time;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = 1;
    //CGPathCloseSubpath(path);
    // CGPathRelease(path);
    //CGPathCloseSubpath(path);
    return animation;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"动画结束了");
    // myTest1.alpha = 0;
    // myTest2.alpha = 1;
    [self addlat];
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
