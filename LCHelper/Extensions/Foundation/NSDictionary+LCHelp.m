//
//  NSDictionary+LCHelp.m
//  LCHelperDemo
//
//  Created by 刘畅 on 2019/4/23.
//  Copyright © 2019 LiuChang. All rights reserved.
//

#import "NSDictionary+LCHelp.h"
#import "NSString+LCHelp.h"

#define isValidKey(key) ((key) != nil && ![key isKindOfClass:[NSNull class]])
#define isValidValue(value) (((value) != nil) && ![value isKindOfClass:[NSNull class]])

@implementation NSDictionary (LCHelp)

- (NSString*)jsonString {
    return [self jsonStringWithOptions:0];
}

- (NSString *)jsonPrettyString {
    return [self jsonStringWithOptions:NSJSONWritingPrettyPrinted];
}

- (NSString *)jsonStringWithOptions:(NSJSONWritingOptions)opt {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:opt error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonStr {
    id value = [jsonStr jsonValue];
    if (value && [value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

@end

@implementation NSDictionary (LCSafe)

- (id)safeObjectForKey:(id)key{
    if (!isValidKey(key)) {
        return nil;
    }
    id obj = [self objectForKey:key];
    if(!isValidValue(obj))
        return nil;
    return obj;
}

- (int)intValueForKey:(id)key{
    id obj = [self safeObjectForKey:key];
    return [obj intValue];
}

- (double)doubleValueForKey:(id)key{
    id obj = [self safeObjectForKey:key];
    return [obj doubleValue];
}

- (NSString*)stringValueForKey:(id)key{
    id obj = [self safeObjectForKey:key];
    if ([obj respondsToSelector:@selector(stringValue)]) {
        return [obj stringValue];
    }
    return nil;
}

@end


@implementation NSMutableDictionary(LCSafe)

- (void)safeSetObject:(id)anObject forKey:(id)aKey{
    if (!isValidKey(aKey)) {
        return;
    }
    if ([aKey isKindOfClass:[NSString class]]) {
        [self setValue:anObject forKey:aKey];
    } else {
        if (anObject != nil) {
            [self setObject:anObject forKey:aKey];
        } else {
            [self removeObjectForKey:aKey];
        }
    }
}

- (void)setIntValue:(int)value forKey:(id)aKey{
    [self safeSetObject:[[NSNumber numberWithInt:value] stringValue] forKey:aKey];
}

- (void)setDoubleValue:(double)value forKey:(id)aKey{
    [self safeSetObject:[[NSNumber numberWithDouble:value] stringValue] forKey:aKey];
    
}

- (void)setStringValueForKey:(NSString*)string forKey:(id)aKey{
    [self safeSetObject:string forKey:aKey];
}


@end
