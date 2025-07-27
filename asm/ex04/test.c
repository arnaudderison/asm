#include <stdio.h>
#include <string.h>

extern int ft_strcmp(const char *s1, const char *s2);

int main() {
    printf("ft_strcmp: %d | strcmp: %d\n", ft_strcmp("doucou", "coucou"), strcmp("doucou", "coucou"));
}