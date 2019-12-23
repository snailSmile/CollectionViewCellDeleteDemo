//
//  CollectionViewCell.m
//  CollectionViewCellDeleteDemo
//
//  Created by 咖啡糖 on 2019/12/23.
//  Copyright © 2019 咖啡糖. All rights reserved.
//

#import "CollectionViewCell.h"
#import <objc/runtime.h>
NSString const *associateString = @"CollectionViewCell";

@interface CollectionViewCell()
@property (nonatomic, strong)UICollectionView *superView;
@end

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
- (void)addGesture
{
    UISwipeGestureRecognizer *gesture =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureMethod:)];
    gesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:gesture];
}
- (void)gestureMethod:(UISwipeGestureRecognizer *)gesture
{
    //查找cell的父视图
    self.superView =[self findSuperView:gesture.view];
    //使用绑定对象的方法获取上一次操作的视图
    id object = objc_getAssociatedObject(self.superView, &associateString);
    if (object != gesture.view && object) {
        [self hideDeleteBtnWithSuperView:object];
    }
    //左滑删除操作
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        objc_setAssociatedObject(self.superView, &associateString, self, OBJC_ASSOCIATION_ASSIGN);
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.label.center = CGPointMake(self.label.center.x - 120 , self.label.center.y);
        } completion:^(BOOL finished) {
            
        }];
    }
}
#pragma mark -查找cell的父视图
- (UICollectionView *)findSuperView:(UIView *)view
{
    if (![view isKindOfClass:[UICollectionView class]])
    {
        id aView = view.superview;
        if ([aView isKindOfClass:[UICollectionView class]])
        {
            return aView;
        }
        else
        {
           return [self findSuperView:aView];
        }
    }
    else
    {
        return view;
    }
}
#pragma mark -隐藏上一次操作的cell
- (void)hideDeleteBtnWithSuperView:(CollectionViewCell *)collectionViewcell
{
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        collectionViewcell.label.center = CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, collectionViewcell.label.center.y);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)setSelected:(BOOL)selected
{
    self.superView =[self findSuperView:self];
    id object = objc_getAssociatedObject(self.superView, &associateString);
    [self hideDeleteBtnWithSuperView:object];
}
@end
