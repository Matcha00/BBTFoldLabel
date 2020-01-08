//
//  BBTFoldLabel.h
//  BBTFoldLabel
//
//  Created by Matcha00 on 2019/10/31.
//

#import <UIKit/UIKit.h>
#import <BBTVerticalAlignmentLabel.h>
#import <BBTFoldLabelConfig.h>
NS_ASSUME_NONNULL_BEGIN



@interface BBTFoldLabel : UIView
@property (nonatomic, strong) BBTVerticalAlignmentLabel *contentLabel;
@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, assign) BOOL unfold;
@property (nonatomic, assign) NSInteger foldLineNum;
@property (nonatomic, copy) NSString *contentString;
@property (nonatomic, assign) CGFloat contentWidth;
@property (nonatomic) UIEdgeInsets *contenetLabelEdgeInsets;
@property (nonatomic, assign) BBTFoldLabelStyle foldLabelStyle;
+ (CGFloat)getFoldLabelHeightAttributedString:(NSAttributedString *)attributedString foldLineNum:(NSInteger)foldLineNum contentWidth:(CGFloat)width bbtFoldLabelStyle:(BBTFoldLabelStyle)foldLabelStyle;
@end

NS_ASSUME_NONNULL_END
