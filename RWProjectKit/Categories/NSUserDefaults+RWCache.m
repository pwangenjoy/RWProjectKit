//
//  NSUserDefaults+RWCache.m
//  XMCategoryDemo
//
//  Created by wangpeng on 16/6/13.
//  Copyright © 2016年 roy wang. All rights reserved.
//

#import "NSUserDefaults+RWCache.h"

static  NSCache *_cache = nil;
static  NSUserDefaults *_userDefaults = nil;

@implementation NSUserDefaults (RWCache)

+ (void)initialize {
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        _cache = [[NSCache alloc] init];
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
}

+ (BOOL)rw_containsKey:(NSString *)key {
    return [self rw_objectForKey:key] != nil;
}

#pragma mark - Object
+ (id)rw_objectForKey:(NSString *)key {
    if (!key) {
        [NSException raise:@"nil key exception" format:@"key can not be nil"];
    }
    
    if ([_cache objectForKey:key]) {
        return [_cache objectForKey:key];
    }
    
    id value = [_userDefaults objectForKey:key];
    
    if (value) {
        [_cache setObject:value forKey:key];
    }
    
    return value;
}

+ (id)rw_objectForKey:(NSString *)key
         defaultValue:(id)defaultValue {
    id value = [self rw_objectForKey:key];
    return value == nil ? defaultValue : value;
}

+ (void)rw_setObjectSynchronizing:(id)value
                           forKey:(NSString *)key {
    [_cache setObject:value forKey:key];
    [_userDefaults setObject:value forKey:key];
    [_userDefaults synchronize];
}


#pragma mark - Bool

+ (BOOL)rw_boolForKey:(NSString *)key
{
    return [[self rw_objectForKey:key] boolValue];
}

+ (BOOL)rw_boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue
{
    id value = [self rw_objectForKey:key];
    return value == nil ? defaultValue : [value boolValue];
}

+ (void)rw_setBoolSynchronizing:(BOOL)value forKey:(NSString *)key
{
    [self rw_setObjectSynchronizing:@(value) forKey:key];
}


#pragma mark - Integer

+ (NSInteger)rw_integerForKey:(NSString *)key
{
    return [[self rw_objectForKey:key] integerValue];
}

+ (NSInteger)rw_integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    id value = [self rw_objectForKey:key];
    return value == nil ? defaultValue : [value integerValue];
}

+ (void)rw_setIntegerSynchronizing:(NSInteger)value forKey:(NSString *)key
{
    [self rw_setObjectSynchronizing:@(value) forKey:key];
}

#pragma mark - Float

+ (float)rw_floatForKey:(NSString *)key
{
    return [[self rw_objectForKey:key] floatValue];
}

+ (float)rw_floatForKey:(NSString *)key defaultValue:(float)defaultValue
{
    id value = [self rw_objectForKey:key];
    return value == nil ? defaultValue : [value floatValue];
}

+ (void)rw_setFloatSynchronizing:(float)value forKey:(NSString *)key
{
    [self rw_setObjectSynchronizing:@(value) forKey:key];
}

#pragma mark - Double

+ (float)rw_doubleForKey:(NSString *)key
{
    return [[self rw_objectForKey:key] doubleValue];
}

+ (float)rw_doubleForKey:(NSString *)key defaultValue:(double)defaultValue
{
    id value = [self rw_objectForKey:key];
    return value == nil ? defaultValue : [value doubleValue];
}

+ (void)rw_setDoubleSynchronizing:(double)value forKey:(NSString *)key
{
    [self rw_setObjectSynchronizing:@(value) forKey:key];
}

#pragma mark - Custom Object

+ (id)rw_customObjectForKey:(NSString *)key
{
    NSData *data = [self rw_objectForKey:key];
    if (!data) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (id)rw_customObjectForKey:(NSString *)key defaultValue:(id)defaultValue
{
    id value = [self rw_customObjectForKey:key];
    return value == nil ? defaultValue : value;
}

+ (void)rw_setCustomObjectSynchronizing:(id)value forKey:(NSString *)key
{
    if (![value respondsToSelector:@selector(encodeWithCoder:)]) {
        return;
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
    if (data) {
        [self rw_setObjectSynchronizing:data forKey:key];
    }
    
}

#pragma mark - Delete

+ (void)rw_removeObjectSynchronizingForKey:(NSString *)key {
    
    [_cache removeObjectForKey:key];
    [_userDefaults removeObjectForKey:key];
    [_userDefaults synchronize];
    
}

+ (void)rw_removeAllObjectsSynchronizing {
    
    [_cache removeAllObjects];
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [_userDefaults removePersistentDomainForName:appDomain];
    [_userDefaults synchronize];
}

@end
