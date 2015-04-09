//
//  BigPhotoVC.h
//  TestChangeColor
//
//  Created by zhhz on 3/27/15.
//  Copyright (c) 2015 zhhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigPhotoVC : UIViewController <UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
- (IBAction)close:(id)sender;

@end
