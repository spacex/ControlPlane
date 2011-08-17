//
//  SynergyKMAction.h
//  MarcoPolo
//
//  Created by Michael Williams on 8/26/10.
//

#import <Cocoa/Cocoa.h>
#import "Action.h"


@interface SynergyKMAction :  Action <ActionWithString> {
	NSString *status;
}

- (id)initWithDictionary:(NSDictionary *)dict;
- (void)dealloc;
- (NSMutableDictionary *)dictionary;

- (NSString *)description;
- (BOOL)execute:(NSString **)errorString;
+ (NSString *)helpText;
+ (NSString *)creationHelpText;

@end
