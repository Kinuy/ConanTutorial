#include <iostream>

#include <spdlog/spdlog.h>
#include <lz4.h>
#include <lz4hc.h>

int main(){
    spdlog::warn("Hi Tobi - this is a simple automated integration workflow for two libs using conan.");

    std::string msg = "kjghaksdfgkldshggklhgkdfh";
    char buffer[1024];

    auto size = LZ4_compress_HC(msg.c_str(), buffer, msg.size() + 1, 1024, LZ4HC_CLEVEL_MAX);
}