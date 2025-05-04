using i32 = int;
using u32 = unsigned int;

extern "C" i32 add_i32(i32 a, i32 b)
{
    return a + b;
}

extern "C" u32 add_u32(u32 a, u32 b)
{
    return a + b;
}