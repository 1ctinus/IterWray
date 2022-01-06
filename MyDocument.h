//
//  MyDocument.h
//  IterWray
//
//  Created by James on 1/3/22.
//  Copyright __MyCompanyName__ 2022 . All rights reserved.
//


#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument
{
	IBOutlet NSTextField *theField;
	IBOutlet id pigUpdate;
	NSString *theText;
 NSAttributedString *DaString;
}
- (IBAction)clip_pushed:(id)sender;
@end
//- (void) setString: (NSString *) value;
