//
//  main.m
//  wildcardproject
//
//  Created by Apoorva Gupta on 3/8/16.
//  Copyright © 2016 Apoorva Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>


int count = 0;
int numberOfAppearances (NSString *StringBase, NSString *pattern)
{
    NSRange range = NSMakeRange(0,StringBase.length);
    if([StringBase rangeOfString:pattern].length !=0)
    {
       // NSLog(@"%lu",[StringBase rangeOfString:pattern].location);
        range = NSMakeRange([StringBase rangeOfString:pattern].location, [StringBase rangeOfString:pattern].length);
        count++;
       // NSLog(@"%i",count);
        StringBase = [StringBase stringByReplacingCharactersInRange:range withString:@""];
        numberOfAppearances(StringBase,pattern);
        
    }
    
   // printf("%d",count);
    return count;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {

            NSMutableString *mainString = [[NSMutableString alloc] initWithString:@"ABCDABCDABCDABDDABADABBD"];
            NSMutableString *subString =  [[NSMutableString alloc] initWithString:@"ABCD"];
            NSMutableString *modifiedString = [[NSMutableString alloc]init];
            modifiedString = subString;
            NSArray *patternArray = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D",nil];
            if([subString rangeOfString:@"*"].length != 0)
            {
                NSRange range = NSMakeRange([subString rangeOfString:@"*"].location, 1);
              //  NSLog(@"%lu",(unsigned long)[subString rangeOfString:@"*"].location);
                        for(int i=0; i<subString.length; i++)
                        {
//                       [modifiedString replaceCharactersInRange:NSMakeRange(0, wildcard.length) withString:[NSString stringWithFormat:@"%@",[patternArray objectAtIndex:i]]];
                            
                            [modifiedString replaceOccurrencesOfString:@"*" withString:[NSString stringWithFormat:@"%@",[patternArray objectAtIndex:i]] options:0 range:NSMakeRange(0, subString.length)];
                            
                            numberOfAppearances(mainString,modifiedString);
                            [modifiedString replaceCharactersInRange:range withString:@"*"];
                          //  modifiedString = subString;
                        }
            }
            else{
                numberOfAppearances(mainString,modifiedString);
                 }
        
    }
    
    NSLog(@"%i",count);
    return 0;
}
