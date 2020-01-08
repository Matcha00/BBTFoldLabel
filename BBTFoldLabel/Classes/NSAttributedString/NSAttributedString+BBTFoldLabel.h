//
//  NSAttributedString+BBTFoldLabel.h
//  BBTFoldLabel
//
//  Created by Matcha00 on 2019/10/31.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, BBTFoldLabelStyle) {
    BBTFoldLabelStyleCut = 0,                       //!<    最后一行样式为最多5个字符拼接...
    BBTFoldLabelStyleNoCut                          //!<   返回最后一行所有字数
};
NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (BBTFoldLabel)
/// 返回当前属性文本 在指定画布大小、最大显示行数下 展示的内容，并返回结果文本行数
- (NSAttributedString *)attributedSubstringWithBoundingSize:(CGSize)size maxNumberOfLines:(NSInteger)maxNumberOfLines numberOfLines:(NSInteger *)numberOfLines bbtFoldLabelStyle:(BBTFoldLabelStyle)foldLabelStyle;

/// 返回当前属性文本 在指定画布大小、最大显示行数下 展示的大小，并返回结果文本行数
- (CGRect)attributedSubstringBoundingRectWithSize:(CGSize)size maxNumberOfLines:(NSInteger)maxNumberOfLines numberOfLines:(NSInteger *)numberOfLines bbtFoldLabelStyle:(BBTFoldLabelStyle)foldLabelStyle;
@end

NS_ASSUME_NONNULL_END
