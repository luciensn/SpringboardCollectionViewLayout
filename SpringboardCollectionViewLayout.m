//
//  SpringboardCollectionViewLayout.m
//  SwipeNav
//
//  Created by Scott Lucien on 6/7/13.
//  Copyright (c) 2013 Scott Lucien. All rights reserved.
//

#import "SpringboardCollectionViewLayout.h"

static NSString * const SpringboardLayoutCellKind = @"CustomCell";


@interface SpringboardCollectionViewLayout (Private)

// Properties
@property (nonatomic, strong) NSDictionary *layoutInfo;

@end

#pragma mark -

@implementation SpringboardCollectionViewLayout

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.itemInsets = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 10.0f);
    self.itemSize = CGSizeMake(75.0, 93.0);
    self.interItemSpacingX = 0.0f;
    self.interItemSpacingY = 0.0f;
    self.numberOfColumns = 4;
}

#pragma mark - Prepare Layout

- (void)prepareLayout
{
    NSMutableDictionary *newLayoutInfo = [NSMutableDictionary dictionary];
    NSMutableDictionary *cellLayoutInfo = [NSMutableDictionary dictionary];
    
    NSInteger sectionCount = [self.collectionView numberOfSections];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    for (NSInteger section = 0; section < sectionCount; section++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        
        for (NSInteger item = 0; item < itemCount; item++) {
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            
            UICollectionViewLayoutAttributes *itemAttributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            itemAttributes.frame = [self frameForCustomCellAtIndexPath:indexPath];
            
            cellLayoutInfo[indexPath] = itemAttributes;
        }
    }
    
    newLayoutInfo[SpringboardLayoutCellKind] = cellLayoutInfo;
    
    self.layoutInfo = newLayoutInfo;
}

#pragma mark - Layout Methods

- (CGRect)frameForCustomCellAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat startingX = (indexPath.section * 320) + 10;
    NSInteger column = indexPath.row % self.numberOfColumns;
    NSInteger row = indexPath.row / self.numberOfColumns;
    CGFloat originX = floor(startingX + (self.itemSize.width + self.interItemSpacingX) * column);
    CGFloat originY = floor((self.itemSize.height + self.interItemSpacingY) * row);
    
    return CGRectMake(originX, originY, self.itemSize.width, self.itemSize.height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];
    
    [self.layoutInfo enumerateKeysAndObjectsUsingBlock:^(NSString *elementIdentifier,
                                                         NSDictionary *elementsInfo,
                                                         BOOL *stop) {
        [elementsInfo enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath,
                                                          UICollectionViewLayoutAttributes *attributes,
                                                          BOOL *innerStop) {
            if (CGRectIntersectsRect(rect, attributes.frame)) {
                [allAttributes addObject:attributes];
            }
        }];
    }];
    
    return allAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.layoutInfo[SpringboardLayoutCellKind][indexPath];
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake((320 * self.collectionView.numberOfSections), self.collectionView.bounds.size.height);
}

@end
