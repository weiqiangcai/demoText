
// .h文件
#define CHOISingletonH  +(instancetype)shareInstance;

// .m文件
#define CHOISingletonM \
\
static id _instace;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
    \
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instace = [super allocWithZone:zone];\
    });\
    return _instace;\
}\
+(instancetype)shareInstance{\
    \
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instace = [[self alloc]init];\
    });\
    return _instace;\
}\
-(id)copyWithZone:(NSZone *)zone{\
    \
    return _instace;\
}
