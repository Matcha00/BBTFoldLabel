//
//  NSAttributedString+BBTFoldLabel.m
//  BBTFoldLabel
//
//  Created by Matcha00 on 2019/10/31.
//

#import "NSAttributedString+BBTFoldLabel.h"
#import <YYText/YYText.h>
@implementation NSAttributedString (BBTFoldLabel)
/// 返回当前属性文本 在指定画布大小、最大显示行数下 展示的内容，并返回结果文本行数
- (NSAttributedString *)attributedSubstringWithBoundingSize:(CGSize)size maxNumberOfLines:(NSInteger)maxNumberOfLines numberOfLines:(NSInteger *)numberOfLines {
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:self];
    *numberOfLines =  layout.lines.count;

    NSMutableAttributedString *mas = self.mutableCopy;
    NSString *string = self.string.copy;
    if (layout.lines.count > maxNumberOfLines) {
        NSRange rangeOfLines2 = layout.lines[maxNumberOfLines - 1].range;
        NSInteger visiableStringLength = 0;
        /*
         获取最后一行文字，清楚换行和空格后判断字符串长度
         */
        NSString *lastLineString = [string substringWithRange:NSMakeRange(rangeOfLines2.location, rangeOfLines2.length)];
        lastLineString = [lastLineString stringByReplacingOccurrencesOfString:@"\r"withString:@""];
        lastLineString = [lastLineString stringByReplacingOccurrencesOfString:@"\n"withString:@""];
        if (lastLineString.length == 0) {
            visiableStringLength = rangeOfLines2.location;
        }else {
            visiableStringLength = rangeOfLines2.location + MIN(5, [string substringWithRange:NSMakeRange(rangeOfLines2.location, lastLineString.length)].length);
        }
        if (string.length >= visiableStringLength) {
            [mas replaceCharactersInRange:NSMakeRange(visiableStringLength , string.length-visiableStringLength) withString:@"..."];
        }
    }
    return mas;
}

/// 返回当前属性文本 在指定画布大小、最大显示行数下 展示的大小，并返回结果文本行数
- (CGRect)attributedSubstringBoundingRectWithSize:(CGSize)size maxNumberOfLines:(NSInteger)maxNumberOfLines numberOfLines:(NSInteger *)numberOfLines {
    NSAttributedString *attributedSubstring = [self attributedSubstringWithBoundingSize:size maxNumberOfLines:maxNumberOfLines numberOfLines:numberOfLines];
    CGRect rect = [attributedSubstring boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect;
}

@end
