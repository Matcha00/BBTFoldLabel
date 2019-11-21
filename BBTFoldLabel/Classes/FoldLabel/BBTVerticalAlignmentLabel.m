//
//  BBTVerticalAlignmentLabel.m
//  BangBangTang
//
//  Created by Matcha00 on 2019/9/2.
//  Copyright © 2019 baozi. All rights reserved.
//

#import "BBTVerticalAlignmentLabel.h"

@implementation BBTVerticalAlignmentLabel


#pragma mark - Init Methods

- (void)dealloc {
    
}

- (instancetype)init
{
    return [super init];
}

#pragma mark - Properties

#pragma mark - Layout Subviews

#pragma mark - Public Methods
- (void)setVerticalAlignment:(BBTVerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}
#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
       switch (self.verticalAlignment) {
              case BBTVerticalAlignmentTop:
              textRect.origin.y = bounds.origin.y;
               break;
           case BBTVerticalAlignmentBottom:
                textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
               break;
            case BBTVerticalAlignmentMiddle:
                // Fall through.
            default:
                textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
        }
    return textRect;
}
-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
#pragma mark - Helper Methods


@end
