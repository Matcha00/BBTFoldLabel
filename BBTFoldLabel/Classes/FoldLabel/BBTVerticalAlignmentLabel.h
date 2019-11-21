//
//  BBTVerticalAlignmentLabel.h
//  BangBangTang
//
//  Created by Matcha00 on 2019/9/2.
//  Copyright © 2019 baozi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, BBTVerticalAlignment) {
    BBTVerticalAlignmentTop                   = 0,         //!< 居上
    BBTVerticalAlignmentMiddle                = 1,         //!< 居中
    BBTVerticalAlignmentBottom                = 2,         //!< 居下
};
@interface BBTVerticalAlignmentLabel : UILabel
@property (nonatomic, assign) BBTVerticalAlignment verticalAlignment;
@end

NS_ASSUME_NONNULL_END
