//
//  HtmlLabel.m
//  iFoxEKnown
//
//  Created by F7684336 on 2015/5/19.
//  Copyright (c) 2015年 idsbg.it. All rights reserved.
//

#import "HtmlLabel.h"

@implementation HtmlLabel

// 此方法可以提取出html语言，并规定其用法
-(NSString *)extractStyleFromText:(NSString *)data
{
    // Replace html entities
    if (data)
    {
        data = [data stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
        data = [data stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
        data = [data stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
        data = [data stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
        data = [data stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];//双引号
        data = [data stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
        data = [data stringByReplacingOccurrencesOfString:@"nbsp;" withString:@" "];
    }
    
    NSMutableArray *components = [NSMutableArray array];
    NSInteger last_position = 0;
    NSString *text = nil;
//    NSString *htmlTag = nil;
    
    NSScanner *scanner = [NSScanner scannerWithString:data];
    
    while (!scanner.isAtEnd)
    {
        // Get position of scanner, used to check if <p> tags are at the start of the text
        NSInteger tagStartPosition = scanner.scanLocation;
        
        // Capture tag text
        [scanner scanUpToString:@"<" intoString:NULL];  //搜索光标到了"<",
        [scanner scanUpToString:@">" intoString:&text]; //把"< >"之间的数据赋给text
        
        NSString *fullTag = [NSString stringWithFormat:@"%@>", text];
        
        //rangOfString: 寻找data字符串里面有没有fullTag。
        NSInteger position = [data rangeOfString:fullTag].location;
        //如果有fullTag
        if (position != NSNotFound)
        {
            // Remove tag from text and replace occurences of paragraph tags
            //如果fullTag里面有"<p" ,（ <p/>是显示段落 ）
            if ([fullTag rangeOfString:@"<p"].location == 0 && tagStartPosition != 0)
            {
                data = [data stringByReplacingOccurrencesOfString:fullTag
                                                       withString:@"\n"
                                                          options:NSCaseInsensitiveSearch
                                                            range:NSMakeRange(last_position, position + fullTag.length - last_position)];
            }
            else
            {
                data = [data stringByReplacingOccurrencesOfString:fullTag
                                                       withString:@""
                                                          options:NSCaseInsensitiveSearch
                                                            range:NSMakeRange(last_position, position + fullTag.length - last_position)];
            }
        }
        
        // Found closing tag
        //如果有"</" ,(</是关闭的符号)
        if ([text rangeOfString:@"</"].location == 0)
        {
            // Get just the html tag value
//            htmlTag = [text substringFromIndex:2];
            
            if (position != NSNotFound)
            {
                // Find the the corresponding component for the closing tag
                for (NSInteger i = components.count - 1; i >= 0; i--)
                {
//                    MDHTMLComponent *component = components[i];
//                    if (component.text == nil && [component.htmlTag isEqualToString:htmlTag])
//                    {
//                        NSString *componentText = [data substringWithRange:NSMakeRange(component.position, position - component.position)];
//                        component.text = componentText;
//                        break;
//                    }
                }
            }
        }
        else
        {
            // Get text components without the opening '<'
            NSArray *textComponents = [[text substringFromIndex:1] componentsSeparatedByString:@" "];
            
            // Capture html tag for later
//            htmlTag = textComponents[0];
            
            // Capture the tag's attributes
            NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
            for (NSUInteger i = 1; i < textComponents.count; i++)
            {
                //以"＝"来分割整个数组
                NSArray *pair = [[textComponents objectAtIndex:i] componentsSeparatedByString:@"="];
                if (pair.count > 0)
                {
                    NSString *key = [[pair objectAtIndex:0] lowercaseString];
                    
                    if (pair.count >= 2)
                    {
                        
                        NSString *value = [[pair subarrayWithRange:NSMakeRange(1, [pair count] - 1)] componentsJoinedByString:@"="];
                        //把value中的 \" 去掉
//                        value = [value stringByReplacingOccurrencesOfString:@"\"" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, 1)];
//                        value = [value stringByReplacingOccurrencesOfString:@"\"" withString:@" " options:NSLiteralSearch range:NSMakeRange([value length]-1, 1)];
                        
                        [attributes setObject:value forKey:key];
                    }
                    else if (pair.count == 1)
                    {
                        [attributes setObject:key forKey:key];
                    }
                }
            }
            
            // Create component from tag and attributes, we'll know the text once we reach the closing tag
//            MDHTMLComponent *component = [[MDHTMLComponent alloc] initWithString:nil htmlTag:htmlTag attributes:attributes];
//            component.position = position;
//            
//            [components addObject:component];
        }
        
        last_position = position;
    }

    return data;
}

@end
