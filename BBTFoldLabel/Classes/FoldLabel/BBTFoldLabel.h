//
//  BBTFoldLabel.h
//  BBTFoldLabel
//
//  Created by Matcha00 on 2019/10/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBTFoldLabel : UIView
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, assign) BOOL unfold;
@property (nonatomic, assign) NSInteger foldLineNum;
@property (nonatomic, copy) NSString *contentString;
@property (nonatomic) UIEdgeInsets *contenetLabelEdgeInsets;
+ (CGFloat)getFoldLabelHeightAttributedString:(NSAttributedString *)attributedString foldLineNum:(NSInteger)foldLineNum contentWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
