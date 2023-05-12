#ifndef PCH_H // precompiled headers
#define PCH_H

// 解决 Qt 中文乱码问题参考 https://qing666888.blog.csdn.net/article/details/79518499
// 如果源文件是 UTF-8 + 无BOM 的编码方式，则一定不能加 #pragma execution_character_set("utf-8")，不然会产生乱码
#if defined(_MSC_VER) && (_MSC_VER >= 1600)
// 中文字符串直接写即可，无需各种嵌套转换
#pragma execution_character_set(push, "UTF-8")
#endif

#define MACRO_YEAR ((((__DATE__[7] - '0') * 10 + (__DATE__[8] - '0')) * 10 + (__DATE__[9] - '0')) * 10 + (__DATE__[10] - '0'))

#define MACRO_MONTH (                                    \
      __DATE__[2] == 'n' ? (__DATE__[1] == 'a' ? 1 : 6)  \
    : __DATE__[2] == 'b' ? 2                             \
    : __DATE__[2] == 'r' ? (__DATE__[0] == 'M' ? 3 : 4)  \
    : __DATE__[2] == 'y' ? 5                             \
    : __DATE__[2] == 'l' ? 7                             \
    : __DATE__[2] == 'g' ? 8                             \
    : __DATE__[2] == 'p' ? 9                             \
    : __DATE__[2] == 't' ? 10                            \
    : __DATE__[2] == 'v' ? 11                            \
    :                      12)

#define MACRO_DAY ((__DATE__[4] == ' ' ? 0 : __DATE__[4] - '0') * 10 + (__DATE__[5] - '0'))

// Add C includes here


#ifdef __cplusplus

// Add C++ includes here


#endif // __cplusplus

#endif // PCH_H
