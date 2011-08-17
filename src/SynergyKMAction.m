//
//  SynergyKMAction.m
//  MarcoPolo
//
//  Created by Michael Williams on 8/26/10.
//

#import "SynergyKMAction.h"


@implementation SynergyKMAction

- (id)init
{
	if (!(self = [super init]))
		return nil;
	
	status = [[NSString alloc] init];
	
	return self;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
	if (!(self = [super initWithDictionary:dict]))
		return nil;
	
	status = [[dict valueForKey:@"parameter"] copy];
	
	return self;
}

- (void)dealloc
{
	[status release];
	
	[super dealloc];
}

- (NSMutableDictionary *)dictionary
{
	NSMutableDictionary *dict = [super dictionary];
	
	[dict setObject:[[status copy] autorelease] forKey:@"parameter"];
	
	return dict;
}

- (NSString *)description
{
	return [NSString stringWithFormat:NSLocalizedString(@"Setting SynergyKM location to '%@'.", @""), status];
}

- (BOOL)execute:(NSString **)errorString
{	
	NSMutableDictionary* post = [NSMutableDictionary dictionary];
	
	[post setObject:[status retain] forKey:@"Location"];
	
	[[NSDistributedNotificationCenter defaultCenter] 
	 postNotificationName: @"NetSourceforgeSynergydShouldChangeLocation" 
	 object: nil
	 userInfo: post];
	
	// There really isn't a way to fail, since postNotificationName doesn't return anything
	if (0) {
		*errorString = NSLocalizedString(@"Couldn't set SynergyKM location!", @"In SynergyKMAction");
		return NO;
	}
	
	return YES;
}

+ (NSString *)helpText
{
	return NSLocalizedString(@"The parameter for SynergyKM actions is the location to set.", @"");
}

+ (NSString *)creationHelpText
{
	return NSLocalizedString(@"Set SynergyKM location to", @"");
}

@end
