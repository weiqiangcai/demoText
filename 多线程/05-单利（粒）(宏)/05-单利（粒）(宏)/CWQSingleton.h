
// 可以修改名字的单利
// .h文件
#define CWQSingletonH(name)  +(instancetype)share##name;

// .m文件
#define CWQSingletonM(name) \
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
+(instancetype)share##name{\
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
