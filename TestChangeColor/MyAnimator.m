//
//  MyAnimator.m
//  TestChangeColor
//
//  Created by zhhz on 3/27/15.
//  Copyright (c) 2015 zhhz. All rights reserved.
//

#import "MyAnimator.h"

@implementation MyAnimator

@synthesize isPresenting;
@synthesize duration;

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.isPresenting = false;
        self.duration = 5.0;
    }
    return self;
}

//时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if(self.isPresenting)
    {
        //present
        [self animatePresenting:transitionContext];
    }
    else{
        //dismissing
        [self animateDismissing:transitionContext];
    }
}

//presenting动画
-(void)animatePresenting:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //注意是toView
    UIViewController * toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * containerView = [transitionContext containerView];
    
    [containerView addSubview:presentedControllerView];
    
    //定位presentedView
    CGRect toViewFrame = [transitionContext finalFrameForViewController:toViewController];

    CGRect appearFrame = toViewFrame;
    CGRect dismissFrame = toViewFrame;
    dismissFrame.origin.y =  dismissFrame.origin.y + containerView.frame.size.height;
    
    CGRect initialFrame = dismissFrame;
    CGRect finalFrame = appearFrame;
    
    [presentedControllerView setFrame:initialFrame];
    
    //执行动画，将presentedView到它的final position
    [UIView animateWithDuration:self.duration delay:0.0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^(void){
                         [presentedControllerView setFrame:finalFrame];
                        
                     }
                     completion:^(BOOL completed){
                         [transitionContext completeTransition:completed];
                     }];
}

//dismming动画
-(void)animateDismissing:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //注意是fromView
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView * containerView = [transitionContext containerView];
    
    CGRect fromViewFrame = [transitionContext finalFrameForViewController:fromViewController];
    
    CGRect appearFrame = fromViewFrame;
    CGRect dismissFrame = fromViewFrame;
    dismissFrame.origin.y =  dismissFrame.origin.y + containerView.frame.size.height;

    
    CGRect initialFrame = appearFrame;
    CGRect finalFrame = dismissFrame;
    
    //动画，将presentedView到底下
    [UIView animateWithDuration:self.duration
                          delay:0.0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^(void){
                         
                        [presentedView setFrame:finalFrame];
                     }
                     completion:^(BOOL completed){
                         [transitionContext completeTransition:completed];
                     }];
}


@end
