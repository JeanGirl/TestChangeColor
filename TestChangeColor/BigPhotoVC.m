//
//  BigPhotoVC.m
//  TestChangeColor
//
//  Created by zhhz on 3/27/15.
//  Copyright (c) 2015 zhhz. All rights reserved.
//

#import "BigPhotoVC.h"
#import "MyPresentationController.h"
#import "MyAnimator.h"

@interface BigPhotoVC ()

@end

@implementation BigPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




-(instancetype)init
{

    self = [super init];
    if (self)
    {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}


-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[MyPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if (presented == self)
    {
        MyAnimator* animator = [[MyAnimator alloc] init];
        [animator setIsPresenting:YES];
        return animator;
    }
    else{
        return nil;
    }
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    if (dismissed == self)
    {
        MyAnimator * animator = [[MyAnimator alloc] init];
        [animator setIsPresenting:NO];
        return animator;
    }
    else{
        return nil;
    }
}


//close presentedView
- (IBAction)close:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
