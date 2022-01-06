//
//  NSString+PigLatin.h
//  IterWray
//
//  Created by James on 1/3/22.
//  Copyright __MyCompanyName__ 2022 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(PigLatin)

-(NSString *)pigifyWord:(NSString *)word;
-(NSString *)stringByPigLatinization:(NSString *)sentence;

@end
