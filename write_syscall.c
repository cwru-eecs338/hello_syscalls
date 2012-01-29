#include<unistd.h>
#include<stdlib.h>

const char message[21] = "Hello System Calls!\n";
const int msg_len = sizeof(message);

int main() {

    // Print Message
    write(1, message, msg_len);

    // Exit
    exit(0);
}
