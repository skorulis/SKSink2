//  Created by Alexander Skorulis on 29/07/2016.
//  Copyright © 2016 Alex Skorulis. All rights reserved.

#import "SKFeatureFlagService.h"

@implementation SKFeatureFlagService {
    NSArray *_flags;
    NSUserDefaults* _userDefaults;
}

- (instancetype)initWithFlags:(NSArray<SKFeatureFlagModel*> *)flags {
    self = [super init];
    _flags = flags.copy;
    _userDefaults = [NSUserDefaults standardUserDefaults];
    _flags = [[NSMutableArray alloc] init];
    return self;
}

- (SKFeatureFlagModel*)flagWithName:(NSString*)name {
    for(SKFeatureFlagModel* flag in _flags) {
        if([flag.title isEqualToString:name]) {
            return flag;
        }
    }
    return nil;
}

- (id) valueForFlagName:(NSString*)flagName {
    return [self flagWithName:flagName].value;
}

- (BOOL)boolForFlagName:(NSString*)flagName {
    return [self flagWithName:flagName].boolValue;
}

- (SKFeatureFlagModel*)addOptionsFlag:(NSString*)title default:(NSString*)value options:(NSArray*)options {
    SKFeatureFlagModel* flag = [[SKFeatureFlagModel alloc] initWithType:SKFeatureFlagTypeOptions title:title options:options];
    flag.value = [_userDefaults valueForKey:[self flagKey:title]];
    flag.value = flag.value ?: value;
    _flags = [_flags arrayByAddingObject:flag];
    return flag;
}

- (SKFeatureFlagModel*) addBoolFlag:(NSString*)title {
    SKFeatureFlagModel* flag = [[SKFeatureFlagModel alloc] initBoolFlagWithTitle:title];
    flag.value = @([_userDefaults boolForKey:[self flagKey:title]]);
    _flags = [_flags arrayByAddingObject:flag];
    return flag;
}

- (void)setFlag:(SKFeatureFlagModel*)flag value:(id)value {
    NSString* key = [self flagKey:flag.title];
    flag.value = value;
    [_userDefaults setObject:value forKey:key];
    [_userDefaults synchronize];
}

- (void)cycleFlag:(SKFeatureFlagModel*)flag {
    //NSParameterException(flag.type == SKFeatureFlagTypeOptions);
    NSInteger index = [flag.options indexOfObject:flag.value];
    index++;
    if(index >= flag.options.count) {
        index = 0;
    }
    [self setFlag:flag value:flag.options[index]];
}

- (void)toggleFlag:(SKFeatureFlagModel*)flag {
    //NSParameterException(flag.type == SKFeatureFlagTypeBOOL);
    BOOL valueNew = !flag.boolValue;
    [self setFlag:flag value:@(valueNew)];
}

- (NSString*)flagKey:(NSString*)name {
    return [NSString stringWithFormat:@"FFKEY:%@",name];
}

- (NSArray*)allFlags {
    return _flags.copy;
}

@end
