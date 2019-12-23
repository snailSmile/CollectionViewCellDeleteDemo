//
//  CollectionViewCell.h
//  CollectionViewCellDeleteDemo
//
//  Created by 咖啡糖 on 2019/12/23.
//  Copyright © 2019 咖啡糖. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
- (void)addGesture;
@end

NS_ASSUME_NONNULL_END
