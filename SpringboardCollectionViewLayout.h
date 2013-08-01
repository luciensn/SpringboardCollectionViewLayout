//
//  SpringboardCollectionViewLayout.h
//  SwipeNav
//
//  Created by Scott Lucien on 6/7/13.
//  Copyright (c) 2013 Scott Lucien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpringboardCollectionViewLayout : UICollectionViewLayout

// Properties
@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingX;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;

@end
