#include <stdio.h>
#include <string.h>

int main() {
    char str1[100];
    char str2[100];

    // printf("Enter the first string: ");
    fgets(str1, sizeof(str1), stdin);

    // printf("Enter the second string: ");
    fgets(str2, sizeof(str2), stdin);

    // Remove the newline character that fgets() stores
    str1[strcspn(str1, "\n")] = '\0';
    str2[strcspn(str2, "\n")] = '\0';

    int len1 = strlen(str1);
    int len2 = strlen(str2);

    if (len1 == len2) {
        printf("Both strings have the same length.\n");
    } else {
        printf("Strings have different lengths.\n");
    }

    return 0; /* important to return zero here */
}
