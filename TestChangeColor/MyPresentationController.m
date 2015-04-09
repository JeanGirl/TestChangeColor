//
//  MyPresentationController.m
//  TestChangeColor
//
//  Created by zhhz on 3/27/15.
//  Copyright (c) 2015 zhhz. All rights reserved.
//

#import "MyPresentationController.h"

@implementation MyPresentationController

-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self)
    {
        self.dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        self.dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        self.dimmingView.alpha = 0.0;//让它不可见
    }
    return self;
}


//presentation快要出现的时候
-(void)presentationTransitionWillBegin
{
    //设置chrome的大小
    self.dimmingView.frame = self.containerView.bounds;
    self.dimmingView.alpha = 0.0;
    
    //chrome和presentedView都是要呈现在界面上的，所以将它们俩都作为subView加到containerView上
    [self.containerView addSubview:self.dimmingView];
    [self.containerView addSubview:self.presentedView];
    
    //执行chrome的淡入
    id transitaionCoordiator = self.presentingViewController.transitionCoordinator;
    [transitaionCoordiator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 1.0;
    } completion:nil];
}

-(void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed)
    {
        [self.dimmingView removeFromSuperview];
    }
}

-(void)dismissalTransitionWillBegin
{
    //执行chrome的淡出
    id transitationCoordinator = self.presentingViewController.transitionCoordinator;
    [transitationCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 0.0;
    } completion:nil];
}

-(void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed)
    {
        [self.dimmingView removeFromSuperview];
    }
}

-(CGRect)frameOfPresentedViewInContainerView
{
    CGRect frame = self.containerView.bounds;
    frame = CGRectInset(frame, 50,150);
    return frame;
}

//-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
//        self.dimmingView.frame = self.containerView.bounds;
//    } completion:nil];
//}

@end
