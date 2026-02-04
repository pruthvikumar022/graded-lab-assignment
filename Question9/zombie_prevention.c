#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    int i;

    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child process created with PID: %d\n", getpid());
            sleep(1);
            exit(0);
        }
    }

    // Parent process cleans up children
    for (i = 0; i < 3; i++) {
        pid = wait(NULL);
        printf("Parent cleaned child process with PID: %d\n", pid);
    }

    return 0;
}
