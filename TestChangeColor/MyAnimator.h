//
//  MyAnimator.h
//  TestChangeColor
//
//  Created by zhhz on 3/27/15.
//  Copyright (c) 2015 zhhz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign)BOOL isPresenting;
@property(nonatomic,assign)NSTimeInterval duration;
@end
