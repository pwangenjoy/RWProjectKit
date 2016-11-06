//
//  NSUserDefaults+RWCache.h
//  XMCategoryDemo
//
//  Created by wangpeng on 16/6/13.
//  Copyright © 2016年 roy wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (RWCache)

/**
 *  Check if a a key exists in NSUserDefaults
 */
+ (BOOL)rw_containsKey:(NSString *)key;



/**
 * NSBundle cache for  BOOL
 */
+ (BOOL)rw_boolForKey:(NSString *)key;

+ (BOOL)rw_boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

+ (void)rw_setBoolSynchronizing:(BOOL)value forKey:(NSString *)key;

/**
 * NSBundle cache for  Integer
 */

+ (NSInteger)rw_integerForKey:(NSString *)key;

+ (NSInteger)rw_integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;

+ (void)rw_setIntegerSynchronizing:(NSInteger)value forKey:(NSString *)key;


/**
 * NSBundle cache for  Float
 */
+ (float)rw_floatForKey:(NSString *)key;

+ (float)rw_floatForKey:(NSString *)key defaultValue:(float)defaultValue;

+ (void)rw_setFloatSynchronizing:(float)value forKey:(NSString *)key;


/**
 * NSBundle cache for  Double
 */
+ (float)rw_doubleForKey:(NSString *)key;

+ (float)rw_doubleForKey:(NSString *)key defaultValue:(double)defaultValue;

+ (void)rw_setDoubleSynchronizing:(double)value forKey:(NSString *)key;


/**
 * NSBundle cache for  Object
 * The value parameter can be only property list objects: NSData, NSString, NSNumber, NSDate, NSArray, or NSDictionary. For NSArray and NSDictionary objects, their contents must be property list objects.
 */
+ (id)rw_objectForKey:(NSString *)key;

+ (id)rw_objectForKey:(NSString *)key defaultValue:(id)defaultValue;

+ (void)rw_setObjectSynchronizing:(id)value forKey:(NSString *)key;


/**
 * NSBundle cache for  Custom Object
 * The custom object needs to implement NSCoding protocol.
 */
+ (id)rw_customObjectForKey:(NSString *)key;

+ (id)rw_customObjectForKey:(NSString *)key defaultValue:(id)defaultValue;

+ (void)rw_setCustomObjectSynchronizing:(id)value forKey:(NSString *)key;




/**
 * NSBundle Delete
 */

+ (void)rw_removeObjectSynchronizingForKey:(NSString *)key;

+ (void)rw_removeAllObjectsSynchronizing;

@end
