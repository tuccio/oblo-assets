using i32 = int;
using u32 = unsigned int;

static u32 g_globalValue = 0;

extern "C" i32 add_i32(i32 a, i32 b)
{
    return a + b;
}

extern "C" u32 add_u32(u32 a, u32 b)
{
    return a + b;
}

extern "C" void set_global_value(u32 v)
{
    g_globalValue = v;
}

extern "C" u32 get_global_value()
{
    return g_globalValue;
}