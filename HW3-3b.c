#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int guess(char *string)
{
    int *len, *i;
    len = (int *)malloc(1 * sizeof(int));
    i = (int *)malloc(1 * sizeof(int));
    *len = strlen(string);
    char *tmp;
    tmp = (char *)malloc(1 * sizeof(char));
    for(*i = 0; *i < *len / 2; *i = *i + 1)
    {
        *tmp = string[*i];
        string[*i] = string[*len - *i - 1];
        string [*len - *i - 1] = *tmp;
    }
    free(len);
    free(i);
    free(tmp);
	return 0;
}

main()
{
    char string[] = "Hello World";
    printf("%s\n", string);
    guess(&string[0]);
    printf("%s\n", string);
}