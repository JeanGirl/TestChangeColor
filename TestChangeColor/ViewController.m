//
//  ViewController.m
//  TestChangeColor
//
//  Created by zhhz on 3/27/15.
//  Copyright (c) 2015 zhhz. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "BigPhotoVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//从左往右放
    
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView  setBackgroundColor:[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5]];
    
    UINib * cellNib = [UINib nibWithNibName:@"cell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"customCell"];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    
    if (0 == indexPath.section)
    {
        if (0 == indexPath.row)
        {           
            cell.imageView.image =[UIImage imageNamed:@"小黑头像.jpg"];
            cell.imageViewLabel.text =@"lewis helmilton";
            
            
        }
        else if (1 == indexPath.row)
        {
            cell.imageView.image =[UIImage imageNamed:@"巴顿头像.jpg"];
            cell.imageViewLabel.text =@"Jason Button";

        }
    }
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self showPresentation:indexPath];
    
}

-(void)showPresentation:(NSIndexPath * )indexPath
{
    BigPhotoVC * bigPhotoVC = [[BigPhotoVC alloc] initWithNibName:@"BigPhotoVC" bundle:nil];
    
    [self presentViewController:bigPhotoVC animated:YES completion:nil];
}

@end
