#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern char *ft_strdup(const char *s);
extern int ft_strlen(const char *s);

int main(void) {
    const char *original = "Hello ASM!";
    char *copy = ft_strdup(original);

    if (!copy) {
        printf("Échec de la duplication (malloc ?).\n");
        return 1;
    }
    printf("Longueur = %d\n", ft_strlen(original));
    printf("Chaîne originale : %s\n", original);
    printf("Chaîne dupliquée : %s\n", copy);

    if (strcmp(original, copy) == 0)
        printf("✅ Les chaînes sont identiques\n");
    else
        printf("❌ Les chaînes sont différentes\n");

    free(copy);
    return 0;
}
