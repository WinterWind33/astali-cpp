// Copyright (c) 2026 Andrea Ballestrazzi
// SPDX-License-Identifier: MIT

#ifdef _WIN32
// TODO: Temporary until the engine is in
#include <Windows.h>
#include <minwindef.h>
#endif // _WIN32

namespace astali {

int common_main() noexcept {
    return 0;
}

} // namespace astali

#ifdef _WIN32
int APIENTRY WinMain(const HINSTANCE inst, const HINSTANCE, LPSTR cmdLine, int showMode) {
    return astali::common_main();
}
#else  // _WIN32
int main(int argc, char* argv[]) {
    return astali::common_main();
}
#endif // _WIN32
