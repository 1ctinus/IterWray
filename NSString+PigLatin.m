//
//  NSString+PigLatin.m
//  IterWray
//
//  Created by James on 1/3/22.
//  Copyright __MyCompanyName__ 2022 . All rights reserved.
//
#import "NSString+PigLatin.h"
// BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[s characterAtIndex:0]];
@implementation NSObject(PigLatin)
NSString *suffix = @"ay";
NSString *vowelString = @"aeiouy";
-(NSString *)pigifyWord:(NSString *)word {
NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];	
BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[word characterAtIndex:0]];
	word = [word lowercaseString];
	BOOL startsWithVowel = [vowels characterIsMember:[word characterAtIndex:0]];

	NSString *wordInPigLatin;
	if(!(startsWithVowel)){
        NSArray *chunks = [[word lowercaseString] componentsSeparatedByCharactersInSet:vowels]; // sw, gg, r
        NSString *desiredChunk = [chunks objectAtIndex:0]; //sw
		
        NSRange firstOccurence = [word rangeOfString:desiredChunk]; //sw
		NSLog(NSStringFromRange(firstOccurence));
		NSString *prefix;
		if(firstOccurence.location == NSNotFound){
		//	NSLog(@"%i", [desiredChunk length]);
			prefix = word;
		} else {
		//NSString *uselessVariable = word;
       prefix = [word stringByReplacingCharactersInRange:firstOccurence withString:@""];
		}
		//NSLog(@"%@", prefix);
        //NSArray *thingy = [prefix, desiredChunk, suffix];
		NSArray *thingy = [[NSArray alloc]initWithObjects:  prefix, desiredChunk, suffix,nil ];
        wordInPigLatin = [thingy componentsJoinedByString:@""];
	} else {
		wordInPigLatin =[word stringByAppendingString:@"yay"];
	}
	if(isUppercase){
		return [wordInPigLatin capitalizedString];
	} else {
	return wordInPigLatin;
	}
}
-(NSString *)stringByPigLatinization:(NSString *)sentence {
	//this!breaks it
	NSCharacterSet *punc = [NSCharacterSet characterSetWithCharactersInString:@"\n,?!.;@ <>{}[]\\/+*()_#"];
    NSMutableString *wordsInPigLatin = [[NSMutableString alloc] init];


	if([sentence characterAtIndex:[sentence length] - 1] == ' '){
		while([sentence characterAtIndex:[sentence length] - 1] == ' '){
			NSLog(@"foo");
			sentence = [sentence substringToIndex:[sentence length] - 1];
		}
	}    
	int iPosition = -1;
	//[words removeObject:@""];
        // we want to split a word by its first chunk of consonants
        // then suffix the word with "ay" and move consonant chunk to the middle
		NSArray *chunks = [sentence componentsSeparatedByCharactersInSet:punc]; // sw, gg, r
		for(int i = 0; i < [chunks count]; i++){
			if(!([[chunks objectAtIndex:i] isEqualToString:@""])){
				[wordsInPigLatin appendString:[NSObject pigifyWord:[chunks objectAtIndex:i]]];
			}
			NSLog(@"chungus %i", [chunks count]);
			iPosition += [[chunks objectAtIndex:i] length] + 1;
			if([chunks count] > 1 && [chunks count] > (i + 1)){
				NSRange range = NSMakeRange(iPosition ,1);
				if(!(range.location == NSNotFound)){
				//int position = range.location + range.length;
					//NSLog(@"fight! og:%i sus:%i", position, iPosition);
				[wordsInPigLatin appendString:[sentence substringWithRange:range]];
			}
		}

    }
    
    NSString *sentenceInPigLatin = (NSString *)wordsInPigLatin;
    return sentenceInPigLatin;
}

@end
