//
//  UIView+RWFrame.h
//  ting
//
//  Created by roy on 15/1/20.
//
//

#import <UIKit/UIKit.h>

@interface UIView (RWFrame)

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;


- (CGFloat)topCenterWith:(UIView *)v;

@end
